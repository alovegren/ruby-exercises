class Meetup
  require 'date'

  def day(weekday, cardinal)
    increment_day_to(weekday.downcase)
    increment_week_to(cardinal.downcase)
    date if date.month == month
  end

  private

  attr_accessor :date
  attr_reader :month

  def initialize(year, month)
    @month = month
    @date = Date.new(year, month)
  end

  def increment_day_to(weekday)
    self.date += 1 until date.strftime("%A").downcase == weekday
    # Date#strftime, when passed "%A", will return the weekday name
  end

  def increment_week_to(cardinal)
    by_n = ['first', 'second', 'third', 'fourth', 'fifth']

    case cardinal
    when 'last'
      increment_week_until do
        seven_days_later = date + 7
        month != seven_days_later.month
      end
    when 'teenth' then increment_week_until { (13..19).include?(date.day) }
    else increment_week_by(by_n.index(cardinal))
    end
  end

  def increment_week_by(n)
    n.times { self.date += 7 }
  end

  def increment_week_until
    self.date += 7 until yield
  end
end

=begin
# We begin on the first day of the given month.
# Adjust that date so that it is the correct day of the week
  - Increment date by one until its `wday` value is the same as the index of
    the DAYS array of the element given by the first arg
# Adjust for 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'
  - Increment date by 7 until a condition is met based on second arg
  - In the case of first, second, third, fourth, fifth
    - Helper method: increment date given cardinal week
      - Add 7 n-many times based on a hash-lookup using 1st, 2nd.. etc.
  - In the case of last
      - Add 7 until adding 7 once more would make it a new month
  - In the case of teenth
    - Helper method: increment date until teenth
      - Add 7 until the day of the month is between 13 and 19

=end
