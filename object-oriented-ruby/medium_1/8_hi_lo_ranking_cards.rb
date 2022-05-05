require "pry"

class Card
  include Comparable

  RANK_TO_VALUE = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  SUIT_RANKS= {'Diamonds' => 0, 'Clubs' => 1, 'Hearts' => 2, 'Spades' => 3 }

  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @value = RANK_TO_VALUE.fetch(rank, rank)
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected

  def <=>(other)
    return -1 if value < other.value
    return 1 if value > other.value
    SUIT_RANKS[suit] <=> SUIT_RANKS[other.suit]
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards

puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]

puts cards.min == Card.new(4, 'Diamonds') #
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]

puts cards.min == Card.new(7, 'Diamonds')
puts cards.max == Card.new('Jack', 'Spades')

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]

puts cards.min == Card.new(8, 'Diamonds')
puts cards.max == Card.new(8, 'Spades')

