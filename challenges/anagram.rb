class Anagram
  def match(arr)
    arr.select do |word| 
      sort(word) == sort(og_word) && og_word != word.downcase
    end
  end

  private
  attr_reader :og_word

  def initialize(word)
    @og_word = word.downcase
  end

  def sort(word)
    word.downcase.chars.sort.join
  end
end

# alternate solution

#  class Anagram
#   def match(arr)
#     arr.select do |word| 
#       word = word.downcase
#       word.chars.tally == base_word_map && og_word != word
#     end
#   end

#   private
#   attr_reader :base_word_map, :og_word

#   def initialize(word)
#     @og_word = word
#     @base_word_map = word.downcase.chars.tally
#   end
#  end

#  def time_this
#   now = Time.now
#   yield
#   later = Time.now
#   later - now