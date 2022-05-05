# Write a class that will display:

# ABC
# xyz

# when the following code is run:

class Transform
  def initialize(input_string)
    @string = input_string
  end

  def uppercase
    @string.upcase
  end

  def self.lowercase(input)
    input.downcase
  end

  private
  attr_reader :string
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')