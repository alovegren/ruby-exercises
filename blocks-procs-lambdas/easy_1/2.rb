def compute
  return 'Does not compute.' unless block_given?
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further exploration

def compute(arg)
  return "The argument given was #{arg}" unless block_given?
  yield(arg)
end

p compute(3) { |arg| arg + 5 }
p compute(3) { "I'm returning this instead" }
p compute(3)