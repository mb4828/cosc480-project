class SchedulesController < ApplicationController
    # This is the root route as the app is currently defined.
    # My thinking is that you can immediately initialize a schedule object here
    # (even though it will be empty) and allow the user to start adding things.
    # Future links back (such as from the new courses page) will go back to
    # the update route.
    def new
	@schedule = Schedule.create
    end

    def create
    end


    # All future attempts to access the main schedule will be routed here
    def edit
    end

    def update
    end
end
