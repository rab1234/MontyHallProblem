Feature: Play the game

  In order to study the Monty Hall Problem
  As a user
  I want to play the game

  Scenario: 1. Display intro
    Given I am on the home page
    Then I should see "Would you like to play a game?"
    And I should not see "Door number 1"
    
  Scenario: 2. Show Choose Door
    Given I am on the home page
    When I follow "Yes!"
    Then I should see "Door number 1"
    And I should not see "Monty's Choice"
    
  Scenario: 3. Show Montys Choice
    Given I am on the home page
    When I follow "Yes!"
    Then I should see "Door number 1" 
    When I choose "Door_2"
    And I follow "Choose"
    Then I should see "Monty's Choice"
