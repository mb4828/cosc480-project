Feature: Save the schedule
    So that I don't have to re-create my schedule each time
    I want to save my schedule

Background: The schedule has several courses
    Given these Courses:
    |name                 |description |sun  |mon  |tue  |wed  |thu  |fri  |sat  |start  |end    |first_name|last_name|email              |
    |Software Engineering |COSC 480    |false|true |false|true |false|true |false|10:20am|11:10am|Zack      |Smith    |zjsmith@colgate.edu|
    |Networking           |COSC 465    |false|true |false|true |false|true |false|11:20am|12:10pm|Zack      |Smith    |zjsmith@colgate.edu|
    |Politics in Education|EDUC 350    |false|true |false|true |false|false|false|2:45pm |4:00pm |Zack      |Smith    |zjsmith@colgate.edu|

Senario: Save a schedule 

