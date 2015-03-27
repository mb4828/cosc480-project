Feature: Edit a class
    As a student 
    So that I can represent my classes on Schedulizer more accurately
    I want to edit a class to my schedule

    Background: The schedule already has a course that was previously created
        Given these Courses:
            |name                 |description |sun  |mon  |tue  |wed  |thu  |fri  |sat  |start  |end    |
            |Software Engineering |COSC 480    |false|true |false|true |false|true |false|10:20am|11:10am|

    Scenario: Change the course name
        Given I am on the new schedule page
        When I press "Edit course"

        Then I should be on the edit courses page
        And I fill in "Name" with "Software Un-engineering"
        And I press "Add to schedule"

        Then I should be on the new schedule page
        And I should see "Software Un-engineering"

    Scenario: Change the course description
        Given I am on the new schedule page
        When I press "Edit course"

        Then I should be on the edit courses page
        And I fill in "Description" with "COSC 1000"
        And I press "Add to schedule"

        Then I should be on the new schedule page
        And I should see "COSC 1000"

    Scenario: Change the course time
        Given I am on the new schedule page
        When I press "Edit course"

        Then I should be on the edit courses page
        And I fill in "Start" with "6:00am"
        And I fill in "End" with "6:01am"
        And I press "Add to schedule"

        Then I should be on the new schedule page
        And I should see "6:00am to 6:01am"
