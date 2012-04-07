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

