Feature: Edit a locked class
    As a developer
    So that saved pages cannot be altered
    I want to lock a schedule once it has been saved

    Background: The schedule already has a course that was previously created
        Given these Courses:
            |name                 |description |sun  |mon  |tue  |wed  |thu  |fri  |sat  |start  |end    | schedule_id | id |
            |Software Engineering |COSC 480    |false|true |false|true |false|true |false|10:20am|11:10am| 0 | 0 |
  
    Scenario: Try to edit a locked schedule
        Given these Schedules:
            | id | locked | user_id |
            | 0  | true   | 0       |

        Given these Users:
            | first_name | last_name | email    | id |
            | Matt       | Brauner   | m@b.com  | 0  |

        When I go to the edit schedule page for schedule 0
        Then I should be on the show schedule page for schedule 0
        And I should see "This schedule cannot be altered"

    Scenario: Attempt to show an unfinished schedule
        Given these Schedules:
            | id | locked |
            | 0  | false  |

        Given I am on the edit schedule page for schedule 0
        When I go to the show schedule page for schedule 0
        Then I should be on the edit schedule page for schedule 0

