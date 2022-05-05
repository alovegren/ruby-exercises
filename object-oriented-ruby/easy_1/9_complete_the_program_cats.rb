# Consider the following program.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, markings)
    super(name, age)
    @markings = markings
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@markings} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Update this code so that when you run it, you see the following output:

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.

# Further Exploration

# An alternative approach to this problem would be to modify the Pet class to accept a colors parameter. If we did this, we wouldn't need to supply an initialize method for Cat.

# Why would we be able to omit the initialize method? Would it be a good idea to modify Pet in this way? Why or why not? How might you deal with some of the problems, if any, that might arise from modifying Pet?

# If we supplied each new instance of the `Pet` class with the `markings` parameter, we could omit the `initialize` method defined in the `Cat` class because subclasses share the attributes and behaviors defined in their parent classes. 

# We would also need to override the `to_s` method for `Pet` in place of what we've done for `Cat`, and would need to identify the two instances defined on lines 21 and 22 as cats. (Perhaps we could call the `class` method on the objects)

# The original solution is perhaps a bit more flexible, since we might want to describe the markings on other types of pets differently. e.g. instead of saying "I'm a cat and I have orange fur" we might want to say "I'm a fish and I have orange scales"