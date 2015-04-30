class SchedulesController < ApplicationController
    include SchedulesHelper
    api_token = '2d0c377b-282c-47e7-b9a1-8d9ea1450d6c'
    @@client = Postmark::ApiClient.new(api_token)

    def index
    end

    def new
	      @schedule = Schedule.create
        render "new"
        cleanup_zombies
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

        # send confirmation e-mail to user
        @@client.deliver(
            :subject => 'Your schedule link',
            :to  => @user.email,
            :from => 'mailbot@mattbrauner.com',
            :html_body =>"Thank you for using College Schedulizer! You can access your schedule at the following URL: \ 
            <a href='" + schedule_path + "' class='alert-link'>" + schedule_url + "</a>",
            :track_opens => 'true'
            )
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
