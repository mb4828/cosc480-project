Feature: Delete zombie schedule
    As a developer
    So that our database isn't filled with unneccessary clutter
    I want to delete schedules that were never finished
    
    Background: There is a preexisting schedule in the database that was never completed
        Given this schedule
            |id|lock |      timestamp        |
            |0 |false|2015-04-09 10:30:45 UTC|
        When I am on the new schedule page
        And the time is 2015-04-10 11:30:45 UTC 
        And I go to the edit schedule page for the schedule with id 0

        Then I should be on the 404 error page
