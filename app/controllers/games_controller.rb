class GamesController < ApplicationController
  def index
    @step = 1
  end
  
  def play
    # user has clicked "Yes!"
    @step = 2
    @game = Game.create!(:w_door => rand(3) + 1)
    render 'index'
  end
  
  def choose
    # user has selected a door
    @step = 3
    @game = Game.first  #need to find by user session
    @game.update_attribute(:u_door, params[:door])
    render 'index'
  end
  
  # -- private --
  private
  def pick_show_door
    g = Game.first
    # remove u_door and w_door from array [1,2,3]
    # remaining door(s) is/are available to show
  end
end
