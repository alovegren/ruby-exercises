require "pry"

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = create_deck
  end

  def create_deck
    RANKS.map do |rank|
      SUITS.map do |suit|
        Card.new(rank, suit)
      end
    end.flatten.shuffle
  end

  def draw
    initialize if cards.empty?
    cards.pop
  end

  private

  attr_accessor :cards
end

class Card
  include Comparable

  RANK_TO_VALUE = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

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
    value <=> other.value
  end
end

Deck.new

deck = Deck.new
drawn = []

52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.