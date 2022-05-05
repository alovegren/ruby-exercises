require 'pry'
=begin
convert numbers to roman

3848 = 3000 + 800 + 40 + 8

break number into places

determine multiplier:
  thousands         - M
    - five hundreds - D
  hundreds          - C
    - fifties       - L
  tens              - X
    - fives         - V
  ones              - I

for each place, divide actual by multiplier
  3000 / 1000 = 3
  800 / 100   = 8
  40 / 10     = 4
  8 / 1       = 8

determine letter based on result:
  - if 1-3
    - concatenate that many multipliers
  - if 4
    - take midpt multiplier
    - prepend the previous multiplier
  - if 5
    - return midpt multiplier
  - if 6-8
    - midpt multiplier plus remaining multipliers
  - if 9
    - prepend previous multiplier to next multiplier

Algorithm
  - Define classes for each place
  -  Find the remainder of the difference between the number and dividing the given number by 1000, then that result by 100, that result by 10 and that result by 1. Save to an instance variable
  - Iterate through the collection
    - Determine multiplier and (next) midpt multiplier i.e. for 100 it would be C and D
    - For the current number, divide it by its place (1000s, 100s, etc)
    - If 1-3
      - Concatenate that many of appropriate multiplier to results string
    - If 4
      - Multiplier + Midpt
    - If 5
      - Midpt
    - If 6-8
      - Midpt + remaining
    - If 9
      - Multiplier + next multiplier
=end

class Places
  attr_reader :letters

  private
  attr_reader :value, :multiplier, :next_midpt, :next_multiplier, :conversion

  def initialize(value)
    @value = value
    @conversion = self.class::CONVERSION
    @multiplier = self.class::MULTIPLIER
    @next_midpt = self.class::NEXT_MIDPT
    @next_multiplier = self.class::NEXT_MULTIPLIER
    @letters = digit_to_letters
  end

  def digit_to_letters
    qty_place = value / conversion

    case qty_place
    when (1..3) then multiplier * qty_place
    when 4 then multiplier + next_midpt
    when 5 then next_midpt
    when (6..8) then next_midpt + (multiplier * (qty_place - 5))
    when 9 then multiplier + next_multiplier
    else ''
    end
  end
end

class Thousands < Places
  MULTIPLIER = 'M'
  CONVERSION = 1000

  def initialize(value)
    @value = value
    @conversion = self.class::CONVERSION
    @multiplier = self.class::MULTIPLIER
    @letters = digit_to_letters
  end
end

class Hundreds < Places
  MULTIPLIER = 'C'
  CONVERSION = 100
  NEXT_MIDPT = 'D'
  NEXT_MULTIPLIER = Thousands::MULTIPLIER
end

class Tens < Places
  MULTIPLIER = 'X'
  CONVERSION = 10
  NEXT_MIDPT = 'L'
  NEXT_MULTIPLIER = Hundreds::MULTIPLIER
end

class Ones < Places
  MULTIPLIER = 'I'
  CONVERSION = 1
  NEXT_MIDPT = 'V'
  NEXT_MULTIPLIER = Tens::MULTIPLIER
end

class RomanNumeral
  attr_reader :to_roman

  private

  def initialize(arabic)
    @to_roman = ''
    @places = [] # add places to array as values are generated
    generate_place_values(arabic)
    generate_roman_digits
  end

  def generate_place_values(arabic)
    [Thousands, Hundreds, Tens, Ones].each do |place_class|
      value = arabic - (arabic % place_class::CONVERSION)
      places << place_class.new(value)
      arabic -= value
    end
  end

  def generate_roman_digits
    places.each { |place| to_roman << place.letters }
  end

  attr_reader :places
end