require "pry"
class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS2A'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      positive / (positive + negative)
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)
    binding.pry

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

# We recall that case statements implicitly use the `===` method to check for equality. When `===` compares two objects, it checks if the object on the left hand side would include the object on the right hand side. In our case, the case statement defined on lines 42-51 is checking for equivalence as determined by `===` between the object referenced by `score` and the object specified by each branch of the case statement.

# Since we're testing for an invalid API key, we should expect the first branch of the case statement to return `true` and for the first string to be output. However, because on line 34 we simply returned the class `NoScore` and not an instance of it, the expression `NoScore === score` returns `false`, so the last String in the case statement is returned instead. We can fix this issue by returning an instance of `NoScore` on line 34.