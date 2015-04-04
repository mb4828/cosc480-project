class Course < ActiveRecord::Base
  belongs_to :schedule

  def get_tag
    output = ""
    output += "S" if self.sunday
    output += "M" if self.monday
    output += "T" if self.tuesday
    output += "W" if self.wednesday
    output += "R" if self.thursday
    output += "F" if self.friday
    output += "S" if self.saturday
    output += " from " + self.start_time + " to " + self.end_time
  end

end
