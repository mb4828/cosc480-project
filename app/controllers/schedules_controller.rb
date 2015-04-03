class SchedulesController < ApplicationController
    def index
    end

    # This is the root route as the app is currently defined.
    # My thinking is that you can immediately initialize a schedule object here
    # (even though it will be empty) and allow the user to start adding things.
    # Future links back (such as from the new courses page) will go back to
    # the update route.
    def new
	      @schedule = Schedule.create
    end

    def create
        # should never be called?
        @schedule = Schedule.save
    end

    # All future attempts to access the main schedule will be routed here
    def edit
        # pass me a list of courses as an instance variable that I can iterate through
    end

    def update
        # create the user object corresponding to the params
        # make sure schedule and user object are linked
        # somehow lock/disable editing - make sure that you can't access the edit view anymore
        # redirect to a "permalink" which for now can just be the default route for the course
          # this will take you to the show view for the course
    end

    def show
      # same as edit... pass me a list of courses to render
    end
end
