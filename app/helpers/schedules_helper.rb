module SchedulesHelper

  def cleanup_zombies
    schedules = Schedule.all
    schedules.each do |s|
        s.destroy if s.is_zombie?
    end
  end

end
