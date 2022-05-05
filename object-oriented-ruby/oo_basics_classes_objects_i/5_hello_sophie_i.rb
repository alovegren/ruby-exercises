class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end

  def try_to_access
    puts @name
  end
end

kitty = Cat.new("Sophie")
puts kitty
kitty.try_to_access