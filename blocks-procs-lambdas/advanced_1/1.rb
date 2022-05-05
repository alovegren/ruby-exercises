factorials = Enumerator.new do |y|
  i = 0
  j = 1
  loop do
    if i == 0 || i == 1
      y << 1
    else
      j *= i
      y << j
    end
    i += 1
  end
end

# external:
7.times { |_| puts factorials.next }
3.times { |_| puts factorials.next }
factorials.rewind
puts "----------------------"
7.times { |_| puts factorials.next }

# internal:

puts "----------------------"
factorials.each_with_index do |factorial, idx|
  puts factorial
  break if idx >= 10
end

puts "----------------------"
factorials.each_with_index do |factorial, idx|
  puts factorial
  break if idx >= 10
end