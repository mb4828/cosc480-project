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
        byebug
        # create the user object corresponding to the params 
        @user = User.create(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email])

        # make sure schedule and user object are linked (done via has_many & belongs_to
        @schedule = Schedule.find(params[:id])
        @schedule.user_id = @user.id

        # somehow lock/disable editing - make sure that you can't access the edit view anymore
        # todo: implement this feature so it actually works!!
        @schedule.locked = true
        @schedule.save

        # redirect to a "permalink" which for now can just be the default route for the course
        redirect_to schedule_path
    end

    def show
        @schedule = Schedule.find(params[:id])
        @courses = @schedule.courses
        @user = @schedule.user
        flash[:notice] = "Your schedule has been saved! You can access it at the following URL: \ 
          <a href='" + schedule_path + "' class='alert-link'>" + schedule_url + "</a>"
    end
end
