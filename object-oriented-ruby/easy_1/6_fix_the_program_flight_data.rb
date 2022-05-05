# Consider the following class definition:

class Flight
  attr_accessor :flight_number
  attr_reader :database_handle

  def database_handle=(new_handle)
    @database_handle = new_handle.init
  end

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?