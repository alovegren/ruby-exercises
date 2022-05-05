# def missing(arr)
#   all_integers = (arr.first..arr.last).to_a
#   missing_integers = []

#   all_integers.each do |int|
#     missing_integers << int unless arr.include?(int)
#   end

#   missing_integers
# end

def missing(arr)
  # without using a block:
  all_integers = (arr.first..arr.last).to_a
  all_integers - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []