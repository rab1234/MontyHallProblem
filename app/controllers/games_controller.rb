class GamesController < ApplicationController
  def index
    @step = 1
  end
  
  def play
    # user has clicked "Yes!"
    @step = 2
    @game = Game.create!(:w_door => get_random_door)
    render 'index'
  end
  
  def choose
    # user has selected a door
    @step = 3
    @game = Game.first  #need to find by user session
    @game.update_attribute(:u_door, params[:door])
    render 'index'
  end
  
  def switch_door
    @step = 4
    @game = Game.first
    render 'index'
  end
  
  def no_switch
    @step = 4
    @game = Game.first
    render 'index'
  end
  
  # -- private --
  private
  def pick_show_door
    g = Game.first
    # remove u_door and w_door from array [1,2,3]
    # remaining door(s) is/are available to show
  end
  
  def get_random_door
    doors = [1,2,3]
    door = doors.sample
    return door
  end
end
