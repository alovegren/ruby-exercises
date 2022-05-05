class Cat
  def self.generic_greeting
    puts "Hello! I'm a Cat!"
  end
end


Cat.generic_greeting

kitty = Cat.new
kitty.class.generic_greeting

# `kitty.class` returns the `Cat` class since `kitty` is an instance of `Cat`. So it is functionally the same thing as invoking `generic_greeting` on `Cat`