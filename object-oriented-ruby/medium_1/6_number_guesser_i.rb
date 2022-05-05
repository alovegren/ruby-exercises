class Player
  def intialize
    @guess = nil
  end

  def get_guess
    input = nil
    loop do
      puts "Enter a number between 1 and 100:"
      input = gets.chomp
      break if (1..100).include?(input.to_i)
      puts "Invalid guess."
    end

    self.guess = input.to_i
  end
  
  attr_accessor :guess
end

class GuessingGame
  def initialize
    @number = (1..100).to_a.sample
    @guesses_remaining = 7
    @game_over = false
    @player = Player.new
  end

  def play
    until guesses_remaining <= 0
      puts "You have #{guesses_remaining} guesses remaining."
      describe_guess(player.get_guess)
      return if game_over
      self.guesses_remaining -= 1
    end

    puts "You have no more guesses. You lost!"
  end

  private

  attr_accessor :guesses_remaining, :game_over
  attr_reader :number, :player

  def describe_guess(guess)
    case guess
    when number
      puts "That's the number!"
      puts "You won!"
      self.game_over = true
    when (1...number)
      puts "Your guess is too low."
    else
      puts "Your guess is too high."
    end
  end
end

GuessingGame.new.play

# The only natural state of the player seems to be the `guess` attribute, so this implementation seems a bit contrived. We also need to pass the player's `guess` attribute into the `describe_guess` method when before we could use the getter method directly available to objects of the `GuessingGame` class.