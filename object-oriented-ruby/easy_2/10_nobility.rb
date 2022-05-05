 # Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.

# We need a new class Noble that shows the title and name when walk is called:


# module Walkable
#   def walk
#     "#{self} #{gait} forward"
#   end
# end

# class Noble
#   include Walkable

#   attr_reader :title, :name

#   def to_s
#     "#{title} #{name}"
#   end

#   def initialize(name, title)
#     @name = name
#     @title = title
#   end

#   private

#   def gait
#     "struts"
#   end

# end

# byron = Noble.new("Byron", "Lord")
# p byron.walk

# => "Lord Byron struts forward"

# This exercise can be solved in a similar manner by using inheritance; a Noble is a Person, and a Cheetah is a Cat, and both Persons and Cats are Animals. What changes would you need to make to this program to establish these relationships and eliminate the two duplicated #to_s methods?

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  def gait
    "walks"
  end

  def walk
    "#{self} #{gait} forward"
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
kitty = Cat.new("Kitty")
flash = Cheetah.new("Flash")
byron = Noble.new("Byron", "Lord")

puts mike.walk
puts kitty.walk
puts flash.walk
puts byron.walk

# Is to_s the best way to provide the name and title functionality we needed for this exercise? Might it be better to create either a different name method (or say a new full_name method) that automatically accesses @title and @name? There are tradeoffs with each choice -- they are worth considering.

# It depends on what else we want to do with our program. If we opt to use `to_s` as in the current implementation, we have to be OK with the fact that outputting the object via string interpolation or a 'puts' statement will always output just the name (or name and title) of the object. If we wanted a more robust version of 'to_s' that indicated the type of animal for some other purpose, it would be better to create a separate `name` or `full_name` method.

# The tradeoff there is that our program would become longer and a bit more complex.