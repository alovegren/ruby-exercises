require 'minitest/autorun'

class EasyTest < MiniTest::Test
  def test_value
    value = true
    assert(value.odd?, 'not odd')
  end
end