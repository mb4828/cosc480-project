class SchedulesController < ApplicationController
    def index
        byebug
    end

    # This is the root route as the app is currently defined.
    # My thinking is that you can immediately initialize a schedule object here
    # (even though it will be empty) and allow the user to start adding things.
    # Future links back (such as from the new courses page) will go back to
    # the update route.
    def new
        byebug
	@schedule = Schedule.create
    end

    def create
        byebug
        @schedule = Schedule.save
    end

    # All future attempts to access the main schedule will be routed here
    def edit  
        byebug
    end

    def update
        byebug
    end
end
