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

Given /^I manually input route$/ do
  #pending
  get '/games/switch_door/'
end

Then /^(?:|I )should go to (.+)$/ do |page_name|
  visit path_to(page_name)
end



