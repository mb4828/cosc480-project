class CoursesController < ApplicationController
    def new
      @schedule = Schedule.find(params[:schedule_id])
      @course = Course.new
    end

    def create
    end

    def edit
    end
    
    def update
    end

    def destroy
    end
end
