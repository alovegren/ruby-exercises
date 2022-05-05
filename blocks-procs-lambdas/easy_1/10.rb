def count(collection)
  count = 0
  collection.each { |item| count += 1 if yield(item) }
  count
end

# Further exploration

def count(collection)
  count = 0
  i = 0

  while i < collection.size
    count += 1 if yield(collection[i])
    i += 1
  end

  count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2