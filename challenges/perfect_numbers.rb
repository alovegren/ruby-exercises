=begin
1.  find aliquot sum:
  - sum of positive divisors (excluding self)
  - find divisors
    - iterate from 1 to square root of number
    - if current value of iteration divides into number, add it to collection
    - divide number by the one just added to collection and add that too
    - subtract number itself from collection
  - sum collected numbers (test this)
  - return 'perfect' if equal to number,
  - 'abundant' if greater,
  - 'deficient' if less
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError unless number >= 1
    return 'perfect' if number == aliquot(number)
    number > aliquot(number) ? 'deficient' : 'abundant'
  end

  class << self
    include Math
    
    private
    def aliquot(number)
      sqrt = sqrt(number)
      divisors = (1..sqrt).each_with_object([]) do |potential, collected|
        div_result, mod = number.divmod(potential)
        collected << potential << div_result if mod == 0
      end
  
      (divisors - [number]).sum
    end
  end
end
