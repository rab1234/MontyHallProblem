require 'spec_helper'

describe "Game" do
  describe "Security" do
    it "prevents mass assignment" do
      # this should raise mass assignment error
      #@game = Game.create!(:w_door => 1, :u_door => 2, :show_door => 3, :other_door => 3)
    end
  end
  
  describe "CRUD actions" do
    before(:each) do
      #@game = Game.create!(:w_door => 1, :u_door => 2, :show_door => 3, :other_door => 3)
    end
    it "saves an instance in the database" do
      #Game.count.should be > 0
    end
    
    it "updates attributes" do
      #@game.update_attribute(:u_door, 1)
      #g = Game.first
      #g.u_door.should == 1
    end
  end
end