Feature: Save the schedule
    So that I don't have to re-create my schedule each time
    I want to save my schedule

    Background: The schedule has several courses
        Given this input:
            |name                 |description |sun  |mon  |tue  |wed  |thu  |fri  |sat  |start  |end    | first    | last  |email         |
            |Software Engineering |COSC 480    |false|true |false|true |false|true |false|10:20am|11:10am| John	    | Doe   |jdoe@jdoe.com |
            |Networking           |COSC 465    |false|true |false|true |false|true |false|11:20am|12:10pm|          |       |              |
            |Politics in Education|EDUC 350    |false|true |false|true |false|false|false|2:45pm |4:00pm |          |       |              |

    Scenario: Save a schedule 

