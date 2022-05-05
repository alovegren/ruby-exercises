# What is wrong with the following code? What fix(es) would you make?

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  #attr_reader :string
  
  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander