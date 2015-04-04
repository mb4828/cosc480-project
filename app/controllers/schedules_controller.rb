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

    def edit
        @schedule = Schedule.find(params[:id])
        @courses = @schedule.courses
    end

    def update
        # create the user object corresponding to the params 
        # make sure schedule and user object are linked (done via has_many & belongs_to
        # somehow lock/disable editing - make sure that you can't access the edit view anymore (done)
        # redirect to a "permalink" which for now can just be the default route for the course
          # this will take you to the show view for the course
        #middle stuff...
        @user = empty_user
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        #email not currently validated, iteration 2.
        @user.email = params[:email]
        @user.save
        redirect_to schedule_path
    end

    def show
        @schedule = Schedule.find(params[:id])
        @courses = @schedule.courses
    end
end
