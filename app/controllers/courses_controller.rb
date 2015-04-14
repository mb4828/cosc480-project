class CoursesController < ApplicationController
    def index
      redirect_to schedule_path(params[:schedule_id])
    end

    def show
      redirect_to schedule_path(params[:schedule_id])
    end

    def new
      @schedule = Schedule.find(params[:schedule_id])
      @course = Course.new
    end

    def create
      @schedule = Schedule.find(params[:schedule_id])
      @course = Course.new(create_update_params)
      # set additional fields (don't forget to set order!!)
      @course.schedule_id = params[:schedule_id]
      @course.save

      if @course.save
        flash[:notice] = "New course #{@course.name} successfully created"
        redirect_to edit_schedule_path(params[:schedule_id])
      else
        flash[:warning] = "Please correct the following errors"
        render "new"    # new_schedule_course_path params[:schedule_id]
      end
    end

    def edit
      @course = Course.find(params[:id])
      @schedule = Schedule.find(params[:schedule_id])
    end
    
    def update
        @schedule = Schedule.find(params[:schedule_id])
        @course = Course.find(params[:id])

        if @course.update(create_update_params)
          flash[:notice] = "#{@course.name} successfully updated"
          redirect_to edit_schedule_path(params[:schedule_id])
        else
          flash[:warning] = "Please correct the following errors"
          render "edit"   # edit_schedule_course_path(params[:schedule_id], params[:id])
        end
    end

    def destroy
        cid = params[:id]
        c = Course.find(cid)
        c.destroy
        if not Course.exists?(cid)
          flash[:notice] = "#{c.name} successfully removed"
          redirect_to edit_schedule_path params[:schedule_id]
        else
          flash[:warning] = "There was an error, the course wasn't removed"
          redirect_to edit_schedule_path params[:schedule_id]
        end
    end

private
    def create_update_params
        params.require(:course).permit(:name, :description, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :start_time, :end_time)
    end

end
