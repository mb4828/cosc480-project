Feature: Add a class
    As a student 
    So that I can represent my classes on Schedulizer
    I want to add a class to my schedule

    Scenario: Create the first course in the schedule
        Given I am on the new schedule page
        When I follow "Add a class"

        Then I should be on the new courses page for schedule 1
        When I fill in the following:
            | Name          | Software Engineering      |
            | Description   | COSC 480                  |
            | Start         | 10:20am                   |
            | End           | 11:10am                   |
	And I check "mon-check"
	And I check "wed-check"
	And I check "fri-check"
        And I press "Add to schedule"

        Then I should be on the edit schedule page for schedule 1
        And I should see "Software Engineering"
        And I should see "COSC 480"
        And I should see "MWF from 10:20am to 11:10am"

    

    Scenario: Create the second course in the schedule
        Given these Courses:
            | name                 | description | monday    | wednesday | friday    | start    | end       | order | schedule_id | id |
            | Software Engineering | COSC 480    | true      | true      | true      | 10:20am  | 11:10am   | 0     | 0 | 0 |
	Given these Schedules:
	    | id | locked |
	    | 0  | false  |
        
        Given I am on the edit schedule page for schedule 0
        Then I should see "Software Engineering"
        Then I should see "COSC 480"
        Then I should see "MWF from 10:20am to 11:10am"
        When I follow "Add a class"

        Then I should be on the new courses page for schedule 0
        When I fill in the following:
            | Name          | Algorithms                |
            | Description   | COSC 302                  |
            | Start         | 11:20am                   |
            | End           | 12:10pm                   |
	And I check "mon-check"
	And I check "wed-check"
	And I check "fri-check"
        And I press "Add to schedule"

        Then I should be on the edit schedule page for schedule 0
        And I should see "Software Engineering"
        And I should see "COSC 480"
        And I should see "MWF from 10:20am to 11:10am"
        And I should see "Algorithms"
        And I should see "COSC 302"
        And I should see "MWF from 11:20am to 12:10pm"
        # But I should see "Software Engineering" above "Algorithms" todo!

