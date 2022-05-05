include Math
require 'prime'

def divisors(int)
  root = sqrt(int).to_i
  results =[1, int]
  return results if int.prime?

  (2..root).each do |potential| # a number's square root is the midpoint of its list of factors
    n_factor = int / potential
    p_factor = int / n_factor

    [n_factor, p_factor].each do |factor|
      results << factor if int % factor == 0
    end
  end

  results.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

