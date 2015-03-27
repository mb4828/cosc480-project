Feature: Delete a class
    As a student 
    So that I can remove a class that I no longer want on my schedule
    I want to be able to delete a class from my schedule

    Scenario: Delete the only course on the schedule
        Given these Courses:
            |name                 |description |sun  |mon  |tue  |wed  |thu  |fri  |sat  |start  |end    |
            |Software Engineering |COSC 480    |false|true |false|true |false|true |false|10:20am|11:10am|

        Given I am on the new schedule page
        When I press "Delete course"
        Then I should be on the new schedule page
        And I should not see "Software Engineering"

    Scenario: Delete one of the courses on the schedule
        Given these Courses:
            |name                 |description |sun  |mon  |tue  |wed  |thu  |fri  |sat  |start  |end    |
            |Software Engineering |COSC 480    |false|true |false|true |false|true |false|10:20am|11:10am|
            |Algorithms           |COSC 302    |false|true |false|true |false|true |false|11:20am|12:10pm|

        Given I am on the new schedule page
        When I press "Delete course" for "Algorithms"
        Then I should be on the new schedule page
        And I should see "Software Engineering"
        But I should not see "Algorithms"

    
