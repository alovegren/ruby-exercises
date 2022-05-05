require 'pry'
=begin
Problem
- Calculate hamming distance. Given two strings representing DNA sequences, count the numbe of differences in bases between the two.

e.g. GAGCCTACTAACGGGAT
     CATCGTAATGACGGCCT
     ^ ^ ^  ^ ^    ^^
There are seven pairs of bases between the two sequences wherein the two bases are different.

To consider a pair 'different', two different letters must occur at the same index in the two strings given. We stop looking for differences at the last index of the shorter string, if there is a difference in lengths.

Data structure
- Strings
- DNATest class, hamming_distance method

Algorithm
- Determine shorter string
- Begin hamming distance count at 0
- Iterate through shorter string keeping track of index
- Add 1 to hamming distance each time elements at the current index in both strings are not the same
=end

class DNA
  def hamming_distance(other_strand)
    shorter_strand = [strand, other_strand].min_by(&:length)
    
    shorter_strand.chars.each_index.count do |idx|
      strand[idx] != other_strand[idx]
    end
  end

  private

  def initialize(strand)
    @strand = strand
  end

  attr_reader :strand
end