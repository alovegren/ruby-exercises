class Scrabble
  attr_reader :score

  def self.score(word)
    self.new(word).score
  end

  private

  attr_reader :word

  def self.generate_tile_scores
    tile_scores = Hash.new(0)

    %w(A E I O U L N R S T).each { |tile| tile_scores[tile] = 1 }
    %w(D G).each { |tile| tile_scores[tile] = 2 }
    %w(B C M P).each { |tile| tile_scores[tile] = 3 }
    %w(F H V W Y).each { |tile| tile_scores[tile] = 4 }
    tile_scores['K'] = 5
    %w(J X).each { |tile| tile_scores[tile] = 8 }
    %w(Q Z).each { |tile| tile_scores[tile] = 10 }

    tile_scores
  end

  TILE_SCORES = generate_tile_scores

  def initialize(word)
    @word = word || ''
    @score = score_word
  end

  def score_word
    word.upcase.chars.reduce(0) { |sum, char| sum + TILE_SCORES[char] }
  end
end
