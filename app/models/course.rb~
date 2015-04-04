class Course < ActiveRecord::Base
  belongs_to :schedule

  def get_tag
    output = ""
    output += "S" if self.sunday == true
    output += "M" if self.monday == true
    output += "T" if self.tuesday == true
    output += "W" if self.wednesday == true
    output += "R" if self.thursday == true
    output += "F" if self.friday == true
    output += "S" if self.saturday == true
    output += " from " + self.start_time + " to " + self.end_time
  end

end
