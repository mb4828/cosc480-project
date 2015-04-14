class Course < ActiveRecord::Base
  belongs_to :schedule

  validates :name, :description, presence: true
  #custom validation needed to check days and
  validates :start_time, :end_time, format: { multiline: true, with: /^([1-9]|1[0-2]):([0-5][0-9])[ap]m$/, message: "format time like 1:02pm"}
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
