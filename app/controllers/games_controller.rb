require 'mathn'

class GamesController < ApplicationController
  attr_accessor :percent_switch, :percent_no_switch
  def index
    @step = 1
  end
  
  def play
    
    @step = 2
    # if user is playing again

      winner = get_random_door
      @game = Game.create!
      @game.w_door = winner
      @game.won = false
      @game.switched = false
      @game.save
      session[:rec_id] = @game.id

    @game.save
    render 'index'
  end
  
  def choose
    # user has selected a door
    #if @step != 2
    #  redirect_to('index')
    #  return
    #end
    @step = 3
    begin
      @game = Game.find(session[:rec_id])
    rescue
      # user has manually entered URL (out of sequence)?
      return redirect_to('/games')
    end
    @game.u_door = params[:id]
    @game.save
    pick_show_door
    render 'index'
  end
  
  def switch_door
    # site is dysfunctional with following line.  I think because @step is not persisted.
    #return redirect_to('index') unless @step == 3
    @step = 4
    #get_user_record
    begin
      @game = Game.find(session[:rec_id])
    rescue
      # user has manually entered URL (out of sequence)?
      return redirect_to('/games')
    end
    @game.sw_door = @game.other_door
    @game.switched = true
    @switched = true
    if @game.w_door == @game.sw_door
      @msg = "You won!"
      @game.won = true
    else
      @msg = "Sorry, you lost."
      @game.won = false
    end
    @game.save
    calc_stats
    @message = "You switched to door number #{@game.sw_door}.  #{@msg}"
    render 'index'
  end
  
  def no_switch
    #if @step != 3
    #  redirect_to('index')
    #  return
    #end
    @step = 4
    @switched = false
    begin
      @game = Game.find(session[:rec_id])
    rescue
      # user has manually entered URL (out of sequence)?
      return redirect_to('/games')
    end
    @game.switched = false
    if @game.w_door == @game.u_door
      @msg = "You won!"
      @game.won = true
    else
      @msg = "Sorry, you lost."
      @game.won = false
    end
    @game.save
    calc_stats
    @message = "You stayed with door number #{@game.u_door}.  #{@msg}"
    render 'index'
  end
  
  # -- private --
  #private
  def calc_stats
    ts = Game.find_all_by_switched(true).count
    sw = Game.find_all_by_switched_and_won(true, true).count
    if ts == 0
      @percent_switch = " No Data "
    else
      @percent_switch = ((sw.to_f / ts.to_f) * 100).round(2)
    end
    
    tns = Game.find_all_by_switched(false).count
    nsw = Game.find_all_by_switched_and_won(false, true).count    
    if tns == 0
      @percent_no_switch = "No Data "
    else
      @percent_no_switch = ((nsw.to_f / tns.to_f) * 100).round(2)
    end
  end
  
  def pick_show_door
    @game = Game.find(session[:rec_id])
    # remove u_door and w_door from array [1,2,3]
    a = [1,2,3]
    b = [@game.u_door, @game.w_door]
    c = a - b  # -- c contains any door not winner and not picked by user --
    
    # return show door from remaining door(s)
    case c.length
    when 2
      # -- if length is 2, user selected winning door; pick show_door from remaining 2 --
      @game.show_door = c[0]
      @game.other_door = c[1]
    when 1
      # -- if length is 1, then user did not pick the winning door --
      @game.show_door = c[0]
      @game.other_door = @game.w_door
    end
    @game.save
  end
  
  def get_random_door
    doors = [1,2,3]
    door = doors.sample
    return door
  end
end
