class Game < ActiveRecord::Base
  attr_accessible :other_door, :show_door, :u_door, :w_door
end
