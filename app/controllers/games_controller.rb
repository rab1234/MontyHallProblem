class GamesController < ApplicationController
  def index
    @step = 1
  end
  
  def play
    # user has clicked "Yes!"
    @step = 2
    @game = Game.create!(:w_door => get_random_door, :SessionID => request.session_options[:id])
    render 'index'
  end
  
  def choose
    # user has selected a door
    @step = 3
    @game = Game.find_by_SessionID(request.session_options[:id])
    @game.update_attribute(:u_door, params[:id])
    render 'index'
  end
  
  def switch_door
    @step = 4
    @game = Game.find_by_SessionID(request.session_options[:id])
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
    c = a - b
    # return show door from remaining doors
    @game.show_door = c.sample
    @game.update_attribute(:show_door => @game.show_door)
    return @game.show_door
  end
  
  def get_random_door
    doors = [1,2,3]
    door = doors.sample
    return door
  end
end
