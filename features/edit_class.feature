Feature: Edit a class
    As a student 
    So that I can represent my classes on Schedulizer more accurately
    I want to edit a class to my schedule

    Background: The schedule already has a course that was previously created
        Given these Courses:
            |name                 |description |sun  |mon  |tue  |wed  |thu  |fri  |sat  |start  |end    | schedule_id | id |
            |Software Engineering |COSC 480    |false|true |false|true |false|true |false|10:20am|11:10am| 0 | 0 |

        Given these Schedules:
            | id | locked |
            | 0  | false  |

    Scenario: Change the course name
        Given I am on the edit schedule page for schedule 0
        When I press "Edit" for "Software Engineering"

        Then I should be on the edit courses page for schedule 0 course 0
        And I fill in "Name" with "Software Un-engineering"
        And I press "Add to schedule"

        Then I should be on the edit schedule page for schedule 0
        And I should see "Software Un-engineering"

    Scenario: Change the course description
        Given I am on the edit schedule page for schedule 0
        When I press "Edit" for "Software Engineering"

        Then I should be on the edit courses page for schedule 0 course 0
        And I fill in "Description" with "COSC 1000"
        And I press "Add to schedule"

        Then I should be on the edit schedule page for schedule 0
        And I should see "COSC 1000"

    Scenario: Change the course time
        Given I am on the edit schedule page for schedule 0
        When I press "Edit" for "Software Engineering"

        Then I should be on the edit courses page for schedule 0 course 0
        And I fill in "Start" with "6:00am"
        And I fill in "End" with "6:01am"
        And I press "Add to schedule"

        Then I should be on the edit schedule page for schedule 0
        And I should see "6:00am to 6:01am"
