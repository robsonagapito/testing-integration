Feature: Json Placeholder CRUD

  Background:
    Given user would like to see all json placeholder

  Scenario: User save a register with post
    When user clicks on find button
    Then user should see "success" message

  Scenario Outline: User save a register with post
    When user clicks on find button
    Then user should see "<response>" message

    Examples:
    |response  |
    |success   |