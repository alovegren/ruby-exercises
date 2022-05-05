# player.rb

class Player
  attr_reader :name
  attr_accessor :health

  def initialize(name, health=50)
    @name = name.capitalize
    @health = health
  end

  def to_s
    healthy = "I'm #{name} with health = #{health}."
    dead = "I was #{name}, now I am dead :(."

    dead? ? dead : healthy
  end

  def hurt
    raise NoMethodError if dead?
    self.health -= 10
  end

  def boost
    raise NoMethodError if dead?
    self.health += 20
  end

  def dead?
    health < 0
  end
end
