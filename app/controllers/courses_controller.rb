class CoursesController < ApplicationController
    def new
      @schedule = Schedule.find(params[:schedule_id])
      @course = Course.new
    end

    def create
      if @course = Course.create(create_update_params)
        flash[:notice] = "New course #{@Course.name} successfully created"
        redirect_to schedule_courses_path
      else
        flash[:warning] = "Course couldn't be created"
        redirect_to schedule_courses_path
      end
    end

    def edit
      @course = Course.find(params[:id])
    end
    
    def update
        @course = Course.find(params[:id])
        if @course.update(create_update_params)
          flash[:notice] = "Update was successful"
          redirect_to schedule_courses_path
        else
          flash[:warning] = "There was an error, the course wasn't updated"
          redirect_to schedule_courses_path
        end
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        if @course.destroy(create_update_params)
          flash[:notice] = "Successfully removed"
          redirect_to schedule_courses_path
        else
          flash[:warning] = "There was an error, the course wasn't removed"
          redirect_to schedule_courses_path
        end
    end

private
    def create_update_params
        params.require(:course).permit(:name, :description, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :start_time, :end_time)
    end

end
