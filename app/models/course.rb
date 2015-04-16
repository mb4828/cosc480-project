class Course < ActiveRecord::Base
  belongs_to :schedule
  validates :name, :description, presence: { message: "This field is required" }
  #custom validation needed to check days
  validates :start_time, :end_time, format: { multiline: true, with: /^(?<hour>[1-9]|1[0-2]):(?<minute>[0-5][0-9])(?<m>[ap]m)$/, message: "Format time like 1:02pm"}
  validate :validate_time

  def validate_time
    return false if self.start_time == ""
    return false if self.end_time == ""

    m = self.start_time.match /^(?<shour>[1-9]|1[0-2]):(?<sminute>[0-5][0-9])(?<sm>[ap]m)$/
    m2 = self.end_time.match  /^(?<ehour>[1-9]|1[0-2]):(?<eminute>[0-5][0-9])(?<em>[ap]m)$/

    shour = m['shour'].to_i
    sminute = m['sminute'].to_i
    sm = m['sm']
    ehour = m2['ehour'].to_i
    eminute = m2['eminute'].to_i
    em = m2['em']

    shour += 12 if sm == "pm"
    ehour += 12 if em == "pm"

    byebug

    if shour > ehour or (shour == ehour and sminute > eminute)
        errors.add(:start_time, "Start time must be before end time")
        errors.add(:end_time, "End time must be after start time")
    elsif shour < 6 or shour > 23
        errors.add(:start_time, "Time must be between 6am and 11pm")
    elsif ehour < 6 or ehour > 23
        errors.add(:end_time, "Time must be between 6am and 11pm")
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
