#
# Scenarios 1 - 3
#
When /^I play the game$/ do
  steps %{
    Given I am on the home page
    Then I should see "Would you like to play a game?"
    And I should not see "Door number 1"
    When I follow "Yes!"
    Then I should see "Door Number 1"
    And I should not see "Monty shows you"
    When I follow "Door Number 1"
    Then I should see "Monty shows you"
  }
end

#
# Scenario 4
#
And /^I manually input a downstream route$/ do
  get '/games/switch_door/'
end

Then /^(?:|I )should go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

#
# scenario outline: outcomes
#
Given /^the following data (\d+), (\d+), (\d+), (\d+)$/ do |arg1, arg2, arg3, arg4|
  @game = Game.create!
  @game.u_door = arg1
  @game.w_door = arg2
  @game.other_door = arg3
  @game.sw_door = arg4
end

When /^asked if I want to switch, I follow (.+)$/ do |arg1|
  click_link(arg1)
end

Then /^I should see you lost$/ do
  
end

Then /^I should see You won!$/ do
  
end


