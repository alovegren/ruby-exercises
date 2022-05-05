# swap all ocurrences of 'a' with 'e'
# test swap
# use a setup and teardown

require 'minitest/autorun'
require_relative 'text_class'
require "minitest/reporters"
Minitest::Reporters.use!

class TextTest < MiniTest::Test
  def setup
    @txt_file = File.new('sample.txt', 'r')
    @text = Text.new(@txt_file.read)
  end

  def test_swap
    qty_a = @text.text.count('a')
    qty_e = @text.text.count('e')
    swapped_text = @text.swap('a', 'e')
    assert_equal (qty_a + qty_e), swapped_text.count('e')
  end

  def test_word_count
    assert_equal 13, @text.word_count
  end

  def teardown
    @txt_file.close
    puts "File has been closed: #{@txt_file.closed?}"
  end
end