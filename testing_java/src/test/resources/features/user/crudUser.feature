Feature: User CRUD

  Scenario: User save a register with post
    Given user would like to save a user
    And user informs login with value equal "stellaagapito"
    And user informs full_name with value equal "Stella da Silva Agapito Correa"
    And user informs email with value equal "stella.agapito@gmail.com"
    And user informs age with value equal "7"
    When user clicks on save button
    Then user should see "save with success" message

  Scenario: User show a register with get
    Given user would like to save a user
    And user informs login with value equal "bugluna"
    And user informs full_name with value equal "Bug Luna Agapito Correa"
    And user informs email with value equal "bug.luna@gmail.com"
    And user informs age with value equal "8"
    When user clicks on save button
    And user wants to see user information
    Then user should see "success" message
    And user should see login with value "bugluna"
    And user should see full_name with value "Bug Luna Agapito Correa"

  Scenario: User update a register with put
    Given user would like to save a user
    And user informs login with value equal "bugluna"
    And user informs full_name with value equal "Bug Luna Agapito Correa"
    And user informs email with value equal "bug.luna@gmail.com"
    And user informs age with value equal "8"
    When user clicks on save button
    And user informs login with value equal "bugluna"
    And user informs full_name with value equal "Bug Luna da Silva Agapito Correa"
    And user informs email with value equal "bug.luna@gmail.com"
    And user informs age with value equal "8"
    And user clicks on save button again
    And user wants to see user information
    Then user should see "success" message
    And user should see full_name with value "Bug Luna da Silva Agapito Correa"

  Scenario: User delete a register with delete
    Given user would like to save a user
    And user informs login with value equal "Toti"
    And user informs full_name with value equal "Toti Agapito Correa"
    And user informs email with value equal "toti@gmail.com"
    And user informs age with value equal "10"
    When user clicks on save button
    And user clicks on delete button
    Then user should see "no content" message

  Scenario: User update a register with patch
    Given user would like to save a user
    And user informs login with value equal "bugluna"
    And user informs full_name with value equal "Bug Luna Agapito Correa"
    And user informs email with value equal "bug.luna@gmail.com"
    And user informs age with value equal "8"
    When user clicks on save button
    And user informs full_name with value equal "Bug Luna da Silva Agapito Correa"
    And user clicks on save button with only one change
    And user wants to see user information
    Then user should see "success" message
    And user should see full_name with value "Bug Luna da Silva Agapito Correa"


