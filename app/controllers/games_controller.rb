class GamesController < ApplicationController
  def index
    @step = 1
  end
  
  def play
    @step = 2
    #@game = Game.create!(:w_door => rand(3) + 1)
    render 'index'
  end
  
  def choose
    @step = 3
    render 'index'
  end
end
