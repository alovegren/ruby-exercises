# Group 1
puts "============ group 1: procs ============"
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc # outputs instance of `Proc` class
puts my_proc.class
my_proc.call # no problem invoking `#call` with no argument. the proc parameter (correct term?) `thing` seems to default to `nil`. (We checked by invoking `inspect` on `thing`) Perhaps it is set up as an instance variable for the `Proc` class and initialized when an argument is passed to `#call`?
my_proc.call('cat') # it's as if we've invoked a method and passed a block, taking the argument passed to `Proc#call` and using it as a block parameter
my_proc.call('cat', 'dog') # it's as if we've invoked a method and passed a block, taking the argument passed to `Proc#call` and using it as a block parameter

missy_proc = proc { puts "This is a #{thing.inspect}." }
# missy_proc.call # This raises a `NameError` just as it would if we were passing a block to a method

# Group 2
puts "============ group 2: lambdas ============"
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# new syntax: `->`
puts my_lambda # still seems to be an instance of the `Proc` class
puts my_second_lambda # seems very similar to the first lambda object
puts my_lambda.class
my_lambda.call('dog') # Acts just like a proc when an argument is passed
# my_lambda.call
# recalling that lambdas have strict arity, maybe calling without an argument will raise an ArgumentError? Yep.
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# Raises a NameError; seems there is no such `Lambda` class
# my_lambda.call('dog', 'cat')
# Can't pass too many arguments either^

# Group 3
puts "============ group 3: blocks ============"
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# Recalling that blocks have lenient arity, I think `seal` defaults to `nil` and we'll see "This is a  ." output. (No argument is passed to `yield`)
# block_method_1('seal')
# This should raise a LocalJumpError since we're attempting to `yield` with no block supplied

# Group 4
puts "============ group 4: blocks ============"
def block_method_2(animal)
  yield(animal) # this time we pass the argument supplied to `block_method_2` to `yield`
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# Should output 'This is a turtle'
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# Due to lenient block arity, the first argument will be the one passed in and the second will default to `nil`
block_method_2('turtle') { puts "This is a #{animal}."}
# With no block parameter, Ruby looks for a local variable `animal` but can't find it.

# Final analysis
=begin

Blocks, procs and lambdas are all closures in Ruby.
  - Blocks and procs behave the same with regards to arity:
    1. The code inside both may be executed without an explicit argument supplied to `#call` (in the case of procs) or `#yield` (for blocks). In that case, the parameters used by either will default to `nil`
    2. The code inside both will also be executed if we supply more arguments to `#call` or `#yield` than specified by the block/proc parameters.
  - Blocks and procs are different in that:
    1. Blocks are unnamed. That is, they cannot be referenced by a local variable while procs can be.
    2. Blocks are passed objects via block local variables at invocation, while procs are passed those objects as arguments to the `#call` method
    3. Procs are instances of the `Proc` class while blocks are not objects.
  - Procs can be created by calling `proc` or `Proc.new`
  - Lambdas seem to be instances of the `Proc` class as well, but are different from blocks and procs in terms of arity:
    1. Lambdas have strict arity. This means that they must be passed the same number of arguments as parameters with which they were defined.
    2. We have additional syntax to define lambdas (using the `lambda` keyword and a block-looking construction, or the `->` and what looks like an argument passed in plus a block sans parameters)

=end