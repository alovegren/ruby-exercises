=begin
Clock keeps track of hours and minutes
- Military time
- 60 minutes in one hour -> exceeding 60 causes 1 hour to be added and the
remainder value (60 - addition) replaces minutes
- 24 hours in one day -> exceeding 24 causes the day to advance, and the new
hour value to be the remainder value of (24 - addition)

Problem
- subtractions and additions are in minutes

- Store value in minutes
- #at creates a new clock object
  - clock objects have day, hour, minute (remaining) and minute (total)
  attributes

- Helper method: given total minutes, set hours and remaining minutes
  - if total minutes is negative, add it to 1440
  - minutes in a day: 1440
  - minutes in an hour: 60
  - set day equal to result of total_minutes / 1440. keep working with remainder
  - set hour equal to result of remainder / 60. keep working with remainder
  - set remaining minutes to remainder

=end
require 'pry'
class Clock
  MINUTES_IN_DAY = 1440
  MINUTES_IN_HR = 60

  def self.at(hour, min=0)
    total_minutes = (hour * MINUTES_IN_HR) + min
    Clock.new(total_minutes)
  end

  def to_s
    hour_str = hours < 10 ? "0#{hours}" : hours
    mins_str = rem_minutes < 10 ? "0#{rem_minutes}" : rem_minutes

    "#{hour_str}:#{mins_str}"
  end

  def +(added_minutes)
    binding.pry
    self.total_minutes += added_minutes
    set_time_attributes
  end

  def -(subtracted_minutes)
    subtracted_minutes *= -1
    self.+(subtracted_minutes)
  end

  def ==(other_clock)
    total_minutes == other_clock.total_minutes
  end

  protected

  attr_accessor :total_minutes

  private

  attr_accessor :hours, :rem_minutes

  def initialize(total_minutes)
    @total_minutes = total_minutes
    set_time_attributes
  end

  def set_time_attributes
    self.total_minutes   += 1440 unless total_minutes.positive?
    remainder_hours       = total_minutes % MINUTES_IN_DAY
    self.hours, remainder = remainder_hours.divmod(MINUTES_IN_HR)
    self.rem_minutes      = remainder
    self
  end
end

clock = Clock.at(10)
clock - 3061
# puts clock