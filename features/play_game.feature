Feature: Play the game

  In order to study the Monty Hall Problem
  As a user
  I want to play the game

  Background:
    Given I am on the home page

  Scenario: 1. Display intro
    Then I should see "Would you like to play a game?"
    And I should not see "Door number 1"
    When I follow "Yes!"
    Then I should see "Door Number 1"
    And I should not see "Monty shows you"
    When I follow "Door Number 1"
    Then I should see "Monty shows you"
    
  Scenario: 2. Show Choose Door
    #When I follow "Yes!"
    #Then I should see "Door Number 1"
    #And I should not see "Monty shows you"
    
  Scenario: 3. Show Montys Choice
    #When I follow "Yes!"
    #Then I should see "Door Number 1" 
    #When I follow "Door Number 1"
    #Then I should see "Monty shows you"
    
  Scenario: 4. Player decides to switch
    #When I follow "Yes!"
    #Then I should see "Door Number 1" 
    #When I follow "Door Number 1"
    #Then I should see "Monty shows you"
    When I play the game
    And I follow "Yes!"
    Then I should see "Players who switched"
    
  Scenario: 5. Player decides not to switch
    When I play the game
    And I follow "No!"
    Then I should see "Players who switched"  
    
  Scenario: 6. User does not access views in correct order
    Given I manually input route
    Then I should be redirected to the home page
    And step should equal 99
    
