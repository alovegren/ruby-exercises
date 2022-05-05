# Complete this program so that it produces the expected output:

class Person
  def first_name=(first_name_input)
    @first_name = first_name_input.capitalize
  end

  def last_name=(last_name_input)
    @last_name = last_name_input.capitalize
  end

  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end

  private
  attr_reader :first_name, :last_name
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person