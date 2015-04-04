class CoursesController < ApplicationController
    def new
      @schedule = Schedule.find(params[:schedule_id])
      @course = Course.new
    end

    def create
      course = Course.new(create_update_params)

      # don't forget to set order!!!

      if course.save
        flash[:notice] = "New course #{course.name} successfully created"
        redirect_to edit_schedule_path
      else
        flash[:warning] = "Course couldn't be created"
        redirect_to edit_schedule_courses_path
      end
    end

    def edit
      @course = Course.find(params[:id])
    end
    
    def update
        @course = Course.find(params[:id])
        if @course.update(create_update_params)
          flash[:notice] = "Update was successful"
          redirect_to edit_schedule_path
        else
          flash[:warning] = "There was an error, the course wasn't updated"
          redirect_to edit_schedule_course_path
        end
    end

    def destroy
        cid = params[:id]
        Course.find(cid).destroy
        if not Course.exists?(cid)
          flash[:notice] = "Successfully removed"
          redirect_to edit_schedule_path
        else
          flash[:warning] = "There was an error, the course wasn't removed"
          redirect_to edit_schedule_path
        end
    end

private
    def create_update_params
        params.require(:course).permit(:name, :description, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :start_time, :end_time)
    end

end
