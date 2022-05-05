class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  # def initialize(diet, superpower)
  #   super
  # end
  # this method is not needed. it automatically inherits the same `initialize` method as defined in `Animal`.

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

=begin
When we instantiate a new `Songbird` object on line 50, the `initialize` method defined in the `Songbird` class is invoked and passed the three arguments specified on line 50.

Within `initialize`, the reserved keyword `super` is executed which tells Ruby to invoke a method of the same name as defined in the calling object's parent class. In this case, it is the `initialize` method defined in the `Bird` class. However, that `initialize` method is defined with only two parameters, and using `super` on its own as on line 37 will automatically call the parent object's method and pass in all of the arguments available to it: in this case, `diet`, `superpower`, and `song`.
=end