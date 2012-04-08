Feature: Play the game

  In order to study the Monty Hall Problem
  As a user
  I want to play the game

  Scenario: 1. Display intro steps
    Given I am on the home page
    Then I should see "Would you like to play a game?"
    And I should not see "Door number 1"
    When I follow "Yes!"
    Then I should see "Door Number 1"
    And I should not see "Monty shows you"
    When I follow "Door Number 1"
    Then I should see "Monty shows you"
    
  Scenario: 2. Player decides to switch
    When I play the game
    And I follow "Yes!"
    Then I should see "Players who switched"
    
  Scenario: 3. Player decides not to switch
    When I play the game
    And I follow "No!"
    Then I should see "Players who switched"  
    
  Scenario: 4. User does not access views in correct order
    Given I am on an unrelated web page
    And I manually input a downstream route
    Then I should go to the home page
    
  Scenario Outline: Game outcomes
    Given I am on the home page
    Then I should see "Would you like to play a game?"
    When I follow "Yes!"
    Then I should see "Door Number 1"
    Given the following data <pick_door>, <win_door>, <other_door>, <switch_door>
    And I follow "Door Number <pick_door>"
    Then I should see "Monty shows you"
    When asked if I want to switch, I follow <choice>
    Then I should see <outcome>
    
    Examples:
    | pick_door | win_door | other_door | switch_door | choice  | outcome  |
    |     1     |     1    |     2      |       3     |   Yes!  | you lost |
    |     1     |     2    |     3      |       1     |   Yes!  | You won! | 
    |     1     |     1    |     2      |       3     |   No!   | You won! |
    |     1     |     2    |     3      |       1     |   No!   | you lost |
    |     1     |     3    |     2      |       3     |   Yes!  | you lost |
        
