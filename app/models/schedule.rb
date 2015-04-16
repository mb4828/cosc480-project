class Schedule < ActiveRecord::Base
  has_many :courses
  belongs_to :user

  def is_zombie?
        if self.locked == false
            update = self.updated_at.to_i
            currtime = Time.now.to_i
            if (currtime-update) > 3600 #3600 seconds in an hour
                return true
            else
                return false
            end
        end
  end
    
end
