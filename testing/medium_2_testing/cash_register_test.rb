require 'pry'
require 'minitest/autorun'
require "minitest/reporters"
require_relative 'cash_register'
require_relative 'transaction'
Minitest::Reporters.use!

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    @transaction.amount_paid = 50
    @register.accept_money(@transaction)
    assert_equal(1050, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 100
    change = @transaction.amount_paid - @transaction.item_cost
    assert_equal(change, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") { @register.give_receipt(@transaction) }
  end
end