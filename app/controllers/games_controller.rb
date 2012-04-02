class GamesController < ApplicationController
  def index
    @step = 1
  end
  
  def play
    @step = 2
    # if user is playing again
    again = params[:again]
    if :again == "Yes"
      @game = Game.find(session[:id])
      @game.w_door = get_random_door
      @game.u_door = 0
      @game.show_door = 0
      @game.other_door = 0
      @game.sw_door = 0
    else
      winner = get_random_door
      @game = Game.create!
      @game.w_door = winner
      @game.save
      session[:id] = @game.id
    end
    @game.save
    render 'index'
  end
  
  def choose
    # user has selected a door
    @step = 3
    @game = Game.find(session[:id])
    @game.u_door = params[:id]
    @game.save
    pick_show_door
    render 'index'
  end
  
  def switch_door
    @step = 4
    @game = Game.find(session[:id])
    @game.sw_door = @game.other_door
    @game.save
    @switched = true
    if @game.w_door == @game.sw_door
      @msg = "You won!"
    else
      @msg = "Sorry, you lost."
    end
    @message = "You switched to door number #{@game.sw_door}.  #{@msg}"
    render 'index'
  end
  
  def no_switch
    @step = 4
    @switched = false
    @game = Game.find(session[:id])
    if @game.w_door == @game.u_door
      @msg = "You won!"
    else
      @msg = "Sorry, you lost."
    end
    @message = "You stayed with door number #{@game.u_door}.  #{@msg}"
    render 'index'
  end
  
  # -- private --
  private
  def pick_show_door
    @game = Game.find(session[:id])
    # remove u_door and w_door from array [1,2,3]
    a = [1,2,3]
    b = [@game.u_door, @game.w_door]
    c = a - b  # -- c contains any door not winner and not picked by user --
    
    # return show door from remaining door(s)
    case c.length
    when 2
      # -- if length is 2, user selected winning door; pick show_door from remaining 2 --
      #@game.show_door = c.sample
      #@game.other_door = (c - [@game.show_door])[0]  # -- the door not shown is the other door --
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
