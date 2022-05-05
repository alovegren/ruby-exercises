class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def declare_state
    puts "All cylinders firing!" if switch == :on
    puts "........." if switch == :off
  end

  private

  def flip_switch(desired_state)
    self.switch = desired_state
  end

  attr_accessor :switch
end

machine = Machine.new

machine.start
machine.declare_state

machine.stop
machine.declare_state