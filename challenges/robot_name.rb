# Robot name should start with two capital letters and end with three digits
# Robot name should 'stick' until it is changed

=begin
# helper method: generate letters OR digits
  - Arguments: qty characters, constant
  - Initialize empty string for characters returned
  - Do this qty-many times
    - Take a random index of the (CONSTANT) array
    - Add the element in the (CONSTANT) array at that index to the empty string
  - Return the string

# main method: add return of invoking the helper method twice, once for digits and once for characters
=end
require 'pry'

class Robot
  @@robot_names = []

  LETTERS = ('A'..'Z').to_a
  DIGITS  = ('0'..'9').to_a

  attr_reader :name

  def reset
    @@robot_names.delete(name)
    self.name = generate_name
  end

  private

  attr_writer :name

  def initialize
    @name = generate_name
    @@robot_names << name
  end

  def generate_name
    new_name = nil
    loop do
      new_name = generate_chars(2, LETTERS) + generate_chars(3, DIGITS)
      break unless @@robot_names.include?(new_name)
    end
    new_name
  end

  def generate_chars(n, char_type)
    chars = ''
    n.times { |_| chars << char_type[rand(char_type.size - 1)] }
    chars
  end
end
