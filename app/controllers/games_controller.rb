class GamesController < ApplicationController
  def index
    @step = 1
  end
  
  def play
    @step = 2
    # if user is playing again
    again = params[:again]
    if :again == "Yes"
      @game = Game.find_by_SessionID(request.session_options[:id])
      @game.w_door = get_random_door
      @game.u_door = nil
      @game.show_door = nil
      @game.other_door = nil
    else
      @game = Game.create!(:SessionID => request.session_options[:id])
      @game.w_door = get_random_door
    end
    @game.save
    render 'index'
  end
  
  def choose
    # user has selected a door
    @step = 3
    @game = Game.find_by_SessionID(request.session_options[:id])
    @game.update_attribute(:u_door, params[:id])
    pick_show_door
    render 'index'
  end
  
  def switch_door
    @step = 4
    @game = Game.find_by_SessionID(request.session_options[:id])
    @game.u_door = @game.other_door
    @game.save
    render 'index'
  end
  
  def no_switch
    @step = 4
    @game = Game.find_by_SessionID(request.session_options[:id])
    render 'index'
  end
  
  # -- private --
  private
  def pick_show_door
    @game = Game.find_by_SessionID(request.session_options[:id])
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
