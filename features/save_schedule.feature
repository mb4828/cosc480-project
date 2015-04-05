Feature: Save the schedule
    So that I don't have to re-create my schedule each time
    I want to save my schedule

    Background: The schedule has several courses
        Given these Schedules:
            | id | locked |
            | 0  | false  |
        Given these Courses:
            |name                 |description |sun  |mon  |tue  |wed  |thu  |fri  |sat  |start  |end    | schedule_id |
            |Software Engineering |COSC 480    |false|true |false|true |false|true |false|10:20am|11:10am| 0           |
            |Networking           |COSC 465    |false|true |false|true |false|true |false|11:20am|12:10pm| 0           |
            |Politics in Education|EDUC 350    |false|true |false|true |false|false|false|2:45pm |4:00pm | 0           |

    Scenario: Save a schedule
        Given I am on the edit schedule page for schedule 0
        When I press "I'm finished!"
        
        Then I should be on the edit schedule page for schedule 0
        When I fill in the following:
            | First name      | James       |
            | Last name       | Bond        |
            | Email           | 007@mi6.com |
        And I press "Save my schedule"
        
        Then I should be on the show schedule page for schedule 0
        And I should see "James Bond's schedule"
        And I should see "Software Engineering"
        And I should see "Networking"
        And I should see "Politics in Education"
        
