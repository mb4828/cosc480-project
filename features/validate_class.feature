Feature: Validate a class
    As a programmer
    So that I can ensure that inputs are formatted properly
    I want to add validation to the forms on the site

    Background:
        Given these Schedules:
            | id    |
            | 0     |

    Scenario: Try to create a blank course
        Given I am on the new courses page for schedule 0
        When I press "Add to schedule"
        Then I should be on the new courses page for schedule 0
        And I should see "Course name required"
        And I should see "Course description required"
        And I should see "At least one day required"
        And I should see "Start time required"
        And I should see "End time required"

    Scenario: Try to create a course with no days
        Given I am on the new courses page for schedule 0
        When I fill in the following:
            | Name          | Dinosaurs     |
            | Description   | RAWR          |
            | Start         | 1:20pm        |
            | End           | 2:30pm        |
        And I press "Add to schedule"
        Then I should be on the new courses page for schedule 0
        And I should see "At least one day required"

    Scenario: Improperly formatted start time
        Given I am on the new courses page for schedule 0
        When I fill in the following:
            | Name          | Dinosaurs     |
            | Description   | RAWR          |
            | Start         | 1:20 PM       |
            | End           | 2:30pm        |
        And I check "tue-check"
        And I check "thu-check"
        And I press "Add to schedule"
        Then I should be on the new courses page for schedule 0
        And I should see "Format time like 1:23pm"

    Scenario: Improperly formatted end time
        Given I am on the new courses page for schedule 0
        When I fill in the following:
            | Name          | Dinosaurs     |
            | Description   | RAWR          |
            | Start         | 1:20pm        |
            | End           | 2:35p.m.      |
        And I check "fri-check"
        And I press "Add to schedule"
        Then I should be on the new courses page for schedule 0
        And I should see "Format time like 1:23pm"

    Scenario: Start time out of range
        Given I am on the new courses page for schedule 0
        When I fill in the following:
            | Name          | Dinosaurs     |
            | Description   | RAWR          |
            | Start         | 3:00am        |
            | End           | 9:30am        |
        And I check "sat-check"
        And I press "Add to schedule"
        Then I should be on the new courses page for schedule 0
        And I should see "Time must be between 6am and 11pm"

    Scenario: End time out of range
        Given I am on the new courses page for schedule 0
        When I fill in the following:
            | Name          | Dinosaurs     |
            | Description   | RAWR          |
            | Start         | 1:20pm        |
            | End           | 11:30pm       |
        And I check "sun-check"
        And I press "Add to schedule"
        Then I should be on the new courses page for schedule 0
        And I should see "Time must be between 6am and 11pm"

    Scenario: All of the above should hold true for editing schedules, too
        Given these Courses:
            |name                 |description |sun  |mon  |tue  |wed  |thu  |fri  |sat  |start  |end    |
            |Software Engineering |COSC 480    |false|true |false|true |false|true |false|10:20am|11:10am|

        Given I am on the edit course page for course 1
        When I fill in the following:
            | Name          |         |
            | Description   |         |
            | Start         |         |
            | End           | 11:01pm |
        And I uncheck "mon-check"
        And I uncheck "wed-check"
        And I uncheck "fri-check"
        And I press "Add to schedule"
        Then I should be on the edit course page for course 1  
        And I should see "Course name required"
        And I should see "Course description required"
        And I should see "At least one day required"
        And I should see "Start time required"
        And I should see "Time must be between 6am and 11pm"

