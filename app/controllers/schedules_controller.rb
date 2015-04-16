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

        # zombie cleanup goes HERE
    end

    def edit
        @schedule = Schedule.find(params[:id])
        if @schedule.locked == true 
            flash[:warning] = "This schedule cannot be altered"
            redirect_to schedule_path
        end
        @courses = @schedule.courses
    end

    def update
        # create the user object corresponding to the params 
        @user = User.create(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email])
        
        # make sure schedule and user object are linked (done via has_many & belongs_to
        @schedule = Schedule.find(params[:id])
        @schedule.user_id = @user.id

        #lock/disable editing
        @schedule.locked = true
        @schedule.save

        # redirect to a "permalink" which for now can just be the default route for the course
        redirect_to schedule_path
    end

    def show

        @schedule = Schedule.find(params[:id])
        @courses = @schedule.courses
        @user = @schedule.user

        if @schedule.locked == false
            redirect_to edit_schedule_path
        else
            flash[:notice] = "Your schedule has been saved! You can access it at the following URL: \ 
            <a href='" + schedule_path + "' class='alert-link'>" + schedule_url + "</a>"
        end
    end
end
