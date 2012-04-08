require 'spec_helper'

describe GamesController do
  describe 'select random door' do
    it 'should return a random number between 1 and 3' do
      @gc = GamesController.new
      d = 0
      d = @gc.get_random_door
      [1,2,3].include?(d).should be true
    end
  end
end