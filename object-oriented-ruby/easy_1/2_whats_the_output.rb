class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

# Further Exploration

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name # => 42
puts fluffy # => My name is 42
puts fluffy.name # => 42
puts name # => 43

# This code "works" because of that mysterious to_s call in Pet#initialize. However, that doesn't explain why this code produces the result it does. Can you?

# The local variable `name` is initialized on line 24 to the Integer `42`, and passed into the instantiation of a new `Pet` object on line 25, which is saved to the local variable `fluffy`. Upon initialization, the instance variable `@name` is assigned to the result of invoking `to_s` on the Integer referenced by `name`.

# While we have overriden the `to_s` method for members of the 'Pet' class, the value referenced by `name` is an Integer, so the call to `to_s` as defined on line 5, invoked as a result of calling the getter method `name` on line 27, returns the String `'42'`.

# On line 28, we invoke the method `puts` (and by extension `to_s`) and pass in the `Pet` object referenced by `fluffy`. This time, we are calling `to_s` on a member of the `Pet` class, so our overriden version of `to_s` kicks in and the String `'My name is 42'` is output. (we note that the result of calling `upcase` on a String with no upcased counterpart returns a copy of the same string)

# When we initialized the `Pet` object and upon initialization invoked `to_s`, the instance variable `@name` referenced a different object than the local variable `name`. So when, on line 26, `name ` is incremented by one, we observe no change in the state of the `Pet` object since `name` is totally divorced from that object.