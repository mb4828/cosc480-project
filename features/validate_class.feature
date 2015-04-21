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
        Then I should be on the course index page for schedule 0
        And I should see "Course name required"
        And I should see "Course description required"
        And I should see "Choose at least one day"
        And I should see "Format time like 1:02pm"

    Scenario: Try to create a course with no days
        Given I am on the new courses page for schedule 0
        When I fill in the following:
            | name-field          | Dinosaurs     |
            | desc-field          | RAWR          |
            | start-field         | 1:20pm        |
            | end-field           | 2:30pm        |
        When I press "Add to schedule"
        Then I should be on the course index page for schedule 0
        And I should see "Choose at least one day"

    Scenario: Improperly formatted start time
        Given I am on the new courses page for schedule 0
        When I fill in the following:
            | name-field          | Dinosaurs     |
            | desc-field          | RAWR          |
            | start-field         | 1:20          |
            | end-field           | 2:30pm        |
        And I check "tue-check"
        And I check "thu-check"
        When I press "Add to schedule"
        Then I should be on the course index page for schedule 0
        And I should see "Format time like 1:02pm"

    Scenario: Improperly formatted end time
        Given I am on the new courses page for schedule 0
        When I fill in the following:
            | name-field          | Dinosaurs     |
            | desc-field          | RAWR          |
            | start-field         | 1:20pm        |
            | end-field           | 2:35p         |
        And I check "fri-check"
        When I press "Add to schedule"
        Then I should be on the course index page for schedule 0
        And I should see "Format time like 1:02pm"

    Scenario: Start time out of range
        Given I am on the new courses page for schedule 0
        When I fill in the following:
            | name-field          | Dinosaurs     |
            | desc-field          | RAWR          |
            | start-field         | 3:00am        |
            | end-field           | 9:30am        |
        And I check "sat-check"
        When I press "Add to schedule"
        Then I should be on the course index page for schedule 0
        And I should see "Time must be between 6am and 10:59pm"

    Scenario: End time out of range
        Given I am on the new courses page for schedule 0
        When I fill in the following:
            | name-field          | Dinosaurs     |
            | desc-field          | RAWR          |
            | start-field         | 1:20pm        |
            | end-field           | 11:30pm       |
        And I check "sun-check"
        When I press "Add to schedule"
        Then I should be on the course index page for schedule 0
        And I should see "Time must be between 6am and 10:59pm"

    Scenario: All of the above should hold true for editing schedules, too
        Given these Courses:
            |name                 |description |sun  |mon  |tue  |wed  |thu  |fri  |sat  |start  |end    | schedule_id |
            |Software Engineering |COSC 480    |false|true |false|true |false|true |false|10:20am|11:10am| 0 |

        Given I am on the edit courses page for schedule 0 course 1
        When I fill in the following:
            | name-field          |         |
            | desc-field          |         |
            | start-field         |         |
            | end-field           | 11:01pm |
        And I uncheck "mon-check"
        And I uncheck "wed-check"
        And I uncheck "fri-check"
        When I press "Add to schedule"
        Then I should be on the show course page for schedule 0 course 1 
        And I should see "Course name required"
        And I should see "Course description required"
        And I should see "Choose at least one day"
        And I should see "Format time like 1:02pm"
        And I should see "Time must be between 6am and 10:59pm"

