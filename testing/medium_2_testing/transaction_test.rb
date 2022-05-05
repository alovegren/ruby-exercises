require 'pry'
require 'minitest/autorun'
require "minitest/reporters"
require_relative 'transaction'
Minitest::Reporters.use!

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(50)
  end

  def test_prompt_for_payment
    input = StringIO.new("50\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal 50, @transaction.amount_paid
  end
end