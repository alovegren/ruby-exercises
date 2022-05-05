include Math

class GuessingGame
  def initialize(bottom_range, top_range)
    @range = (bottom_range..top_range)
    @number = range.to_a.sample
    @guesses_remaining = Math.log2(range.size).to_i + 1s
    @game_over = false
    @guess = nil
    @top = top_range
    @bottom = bottom_range
  end

  def play
    until guesses_remaining <= 0
      puts "You have #{guesses_remaining} guesses remaining."
      puts "Hint: guess #{hint}"
      validate
      describe_guess
      return if game_over
      self.guesses_remaining -= 1
    end

    puts "You have no more guesses. You lost!"
  end

  private

  attr_accessor :guesses_remaining, :game_over, :guess, :top, :bottom
  attr_reader :number, :range

  def validate
  input = nil

    loop do
      puts "Enter a number between #{range.first} and #{range.last}:"
      input = gets.chomp
      break if range.cover?(input.to_i)
      puts "Invalid guess."
    end

    self.guess = input.to_i
  end

  def describe_guess
    case guess
    when number
      puts "That's the number!"
      puts "You won!"
      self.game_over = true
    when (1...number)
      puts "Your guess is too low."
      self.bottom= guess
    else
      puts "Your guess is too high."
      self.top = guess
    end
  end

  def hint
    bottom + ((top - bottom) / 2)
  end
end

GuessingGame.new(1, 12421).play