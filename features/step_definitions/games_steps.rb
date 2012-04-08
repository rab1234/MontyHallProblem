When /^I play the game$/ do
  steps %{
    Then I should see "Would you like to play a game?"
    And I should not see "Door number 1"
    When I follow "Yes!"
    Then I should see "Door Number 1"
    And I should not see "Monty shows you"
    When I follow "Door Number 1"
    Then I should see "Monty shows you"
  }
end

Given /^I manually input route$/ do
  pending
  @step = 99
  get '/games/switch_door/'
end

Then /^I should be redirected to the home page$/ do
  pending
  get '/games'
end

Then /^step should equal (\d+)$/ do |arg1|
  pending
  @step.should == arg1
end

