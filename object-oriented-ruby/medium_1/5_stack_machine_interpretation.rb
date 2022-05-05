require "pry"

class InvalidCommand < StandardError; end
class EmptyStack < StandardError; end

module Validating
  VALID_COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def integer?(command)
    command.to_i.to_s == command
  end

  def validate_command(command)
    unless VALID_COMMANDS.include?(command) || integer?(command)
      raise InvalidCommand, "Invalid token: #{command}"
    end
  end
end



class Minilang
  include Validating

  def initialize(program)
    @stack = []
    @register = 0
    @program = program
  end

  def eval
    commands = program.split
    
    commands.each do |command|
      validate_command(command)
      instruction = interpret(command)

      if instruction == :register_value
        value = command.to_i
        register_value(value)
      else
        send(instruction)
      end
    end
  end

  private

  def interpret(command)
    return :register_value if integer?(command)
    command.downcase.to_sym
  end

  def register_value(n)
    self.register = n
  end

  def push
    stack << register
  end

  def operate(operation)
    self.register = register.send(operation, stack.pop)
  end

  def add
    operate(:+)
  end

  def sub
    operate(:-)
  end

  def mult
    operate(:*)
  end

  def div
    operate(:/)
  end

  def mod
    operate(:%)
  end

  def pop
    raise EmptyStack, 'Empty stack!' if stack.empty?
    self.register = stack.pop
  end

  def print
    puts register
  end

  attr_accessor :stack, :register, :program
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)