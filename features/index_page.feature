Feature: Load landing page
    As a user
    So that I can learn about Schedulizer
    I want the root of the site to be a landing page with information about the Schedulizer

Scenario: Jump to blank schedule page
    Given I am on the landing page
    When I follow "Click here to create schedule"
    Then I should be on the new schedule page


