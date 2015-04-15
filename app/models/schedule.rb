class Schedule < ActiveRecord::Base
  has_many :courses
  belongs_to :user

  def zombie ()
    Schedule.all.each do |schedule|
        if schedule.locked == false
            update = schedule.updated_at.to_i
            currtime = Time.now.to_i
            if (currtime-update) > 3600 #3600 seconds in an hour
                schedule.destroy
            end
        end
    end
  end
    
end
