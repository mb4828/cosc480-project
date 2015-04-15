class Course < ActiveRecord::Base
  belongs_to :schedule
  validates :name, :description, presence: { message: "this field is required" }
  #custom validation needed to check days
  validates :start_time, :end_time, format: { multiline: true, with: /^(?<hour>[1-9]|1[0-2]):(?<minute>[0-5][0-9])(?<m>[ap]m)$/, message: "format time like 1:02pm"}
  ##validate :validate_time

  def validate_time
    self.start_time =~ /^(?<shour>[1-9]|1[0-2]):(?<sminute>[0-5][0-9])(?<sm>[ap]m)$/
    self.end_time =~  /^(?<ehour>[1-9]|1[0-2]):(?<eminute>[0-5][0-9])(?<em>[ap]m)$/
    if sm == "pm" && em == "am"
        return false
    
    elsif shour > ehour
        return false
    elsif sminute >= eminute 
        return false 
    else
        return true
    end 
  end

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
