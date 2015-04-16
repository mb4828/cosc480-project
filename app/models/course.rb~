class Course < ActiveRecord::Base
  belongs_to :schedule
  validates :name, :description, presence: { message: "This field is required" }
  validates :start_time, :end_time, format: { multiline: true, with: /^(?<hour>[1-9]|1[0-2]):(?<minute>[0-5][0-9])(?<m>[ap]m)$/, message: "Format time like 1:02pm"}
  validate :start_in_range, :end_in_range, :start_before_end, :at_least_one_day


  def get_start_time
    m = self.start_time.match /^(?<shour>[1-9]|1[0-2]):(?<sminute>[0-5][0-9])(?<sm>[ap]m)$/
    return [m['shour'].to_i, m['sminute'].to_i, m['sm']]
   
  end

  def get_end_time
    m = self.end_time.match  /^(?<ehour>[1-9]|1[0-2]):(?<eminute>[0-5][0-9])(?<em>[ap]m)$/
    return [m['ehour'].to_i, m['eminute'].to_i, m['em']]
  end

  def time_in_range(hour24, am)
    return false if hour24 < 6 or hour24 >= 23
    return false if hour24 == 12 and am
    return true
  end

  def start_before_end
    return if self.start_time == ""
    return if self.end_time == ""

    s = get_start_time
    shour = s[0]
    sminute = s[1]
    sm = s[2]

    e = get_end_time
    ehour = e[0]
    eminute = e[1]
    em = e[2]

    shour += 12 if sm == "pm"
    ehour += 12 if em == "pm"
    
    if shour > ehour or (shour == ehour and sminute > eminute)
        errors.add(:start_time, "Start time must be before end time")
        errors.add(:end_time, "End time must be after start time")
    end
  end

  def start_in_range
      return if self.start_time == ""
      s = get_start_time
      shour = s[0]
      sm = s[2]

      shour += 12 if sm == "pm" and shour != 12
      
      if not time_in_range(shour, sm == "am")
          errors.add(:start_time, "Time must be between 6am and 10:59pm")
      end
  end

  def end_in_range
      return if self.end_time == ""
      e = get_end_time
      ehour = e[0]
      em = e[2]

      ehour += 12 if em == "pm" and ehour != 12

      if not time_in_range(ehour, em == "am")
        errors.add(:end_time, "Time must be between 6am and 10:59pm")
      end
  end

  def at_least_one_day
      if self.sunday.blank? and \
        self.monday.blank? and \
        self.tuesday.blank? and \
        self.wednesday.blank? and \
        self.thursday.blank? and \
        self.friday.blank? and \
        self.saturday.blank?

          errors.add(:saturday, "Choose at least one day")
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
