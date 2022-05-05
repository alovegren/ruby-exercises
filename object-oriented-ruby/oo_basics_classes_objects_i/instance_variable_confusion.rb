class Bicyclist
  attr_writer :age
  attr_accessor :name

  # def initialize(name)
  #   @name = name
  # end

end

flanders = Bicyclist.new
p flanders
p flanders.name
flanders.age = nil
p flanders
