require 'pry'
=begin

  A
 B B
C   C
 B B
  A

    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A

the diamond as a whole has one attribute:
  - diamond width: position of letter in alphabet + (position - 1)
  - e.g. 'C' -> c is 3rd in the alphabet so the diamond at its widest point is
  3 spaces wide, plus two more spaces for the 'C's at each end

each line has attributes:
  - its row number
  - its letter
  - number of spaces between letters: diamond width minus two (for current
  letters), minus (2*space outside letters)
  - number of spaces outside letters (on both sides): position of final letter
  minus row number (on either side)

  - e.g. row A, largest letter E
  - E position 5
  - diamond width = 5 + 4 = 9
  - A position 1
  - row A, spaces outside letters: 5 - 1 = 4
  - row A, no space between

  - e.g. row B, largest E
  - E position 5
  - diamond width = 9
  - B position 2
  - row B, spaces outside = 5 - 2 = 3
  - row B, spaces in between = 9 - 2 - (3*2)

  - row C
  - position 3
  - spaces outside = 5 - 3 = 2
  - spaces in between = 9 - 2 - (2*2)

- begin with 'A\n'
- set diamond width
- iterate from B to letter
  - set row number (idx + 2)
  - set spaces between
  - set spaces on side
  - add to final str:
    space on side + letter + space between + letter + side + \n
- Add 'A\n'
=end

class Diamond
  def self.make_diamond(letter)
    letters         = ('A'..letter).to_a
    letter_position = letters.size
    diamond_width   = (letter_position * 2) - 1
    center          = 0
    side            = (diamond_width - 1) / 2

    generate_rows(letters, side, center)
  end

  class << self
    private

    def generate_string(letter, side, center)
      side    = ' ' * side
      center  = ' ' * center
      return (side + letter + side + "\n") if letter == 'A'
      side + letter + center + letter + side + "\n"
    end

    def generate_rows(letters, side, center)
      final_strings = []
      letters.each do |row_letter| # call to #each builds top half of diamond
        final_strings << generate_string(row_letter, side, center)
        center = row_letter == 'A' ? center + 1 : center + 2
        # ^increment center space by one or two
        side -= 1 # decrement outer spaces by one
      end

      final_strings += final_strings[0..-2].reverse
      # ^duplicates diamond thus far, minus widest row, then adds its reverse
      final_strings.join
    end
  end
end
