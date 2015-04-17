Feature: Delete zombie schedule
    As a developer
    So that our database isn't filled with unneccessary clutter
    I want to delete schedules that were never finished
    
    Background: There is a preexisting schedule in the database that was never completed
        Given these Schedules:
            |id|locked |      updated_at        |
            |0 |false|2015-04-09 10:30:45 UTC|
        When I am on the new schedule page
        And the time is 2015-04-10 11:30:45 UTC 
        Then I shouldn't be able to access the edit schedule page for schedule 0
