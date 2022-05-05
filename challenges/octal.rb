require 'pry'
=begin
233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

- Break number into digits
  - convert to string, then to chars e.g. 1234 -> "1234" -> ['1', '2', '3', '4']
  - map chars to integers, reverse order e.g. [1, 2, 3, 4] -> [4, 3, 2, 1]
  - iterate thru and multiply each number by (8^i) where i is the index in the array [4, 3, 2, 1] -> [4, 24, 128, 512]
  - sum that array  [4, 24, 128, 512] -> 668

=end

class Octal
  def to_decimal
    #binding.pry
    return 0 if octal.match(/8|9|[^0-9]/)
    octal.chars.map(&:to_i).reverse.each_with_index.map do |digit, idx|
      digit * (8**idx)
    end.sum
  end

  private

  attr_reader :octal

  def initialize(num)
    @octal = num
  end
end

p Octal.new('1234').to_decimal