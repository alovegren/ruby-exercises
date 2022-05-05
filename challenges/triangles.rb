require 'pry'
=begin
Problem: given three integers representing lengths of a triangle, determine whether that triangle would be equilateral, isosceles or scalene.
  legal triangles: all sides > 0 and the sum of any two lengths must be greater than the third
  equilateral: all sides same
  isosceles: two sides same
  scalene: all sides different

Example:
  (3, 3, 3) -> equilateral
  (2, 2, 3) -> isosceles
  (2, 3, 4) -> scalene
  (0, 1, 2) -> not a triangle
  (-1, 2, 3) -> not a triangle
  (1, 2, 3) -> not a triangle (2 + 1 not greater than 3)

Data Structure
  - Triangle class
  - Sides saved in array (attribute)

Algorithm
- method: valid_lengths?
  - lengths at idx 0 and 1 sum to greater than 2
  - lengths at idx 0 and 2 sum to greater than 1
  - lengths at idx 1 and 2 sum to greater than 0
    - get all combinations of indices ([[0, 1], [0, 2], [1, 2]])
    - iterate thru each combo, returning true if for *every* combo:
      - sum of sides elems at combo indices > side elem at remaining index
      - side elem at remaining index: reject sides indices which are either combo (if combo is [0, 1], reject from [0, 1, 2] 0 and 1)
=end

class Triangle
  attr_reader :kind

  private
  def initialize(l1, l2, l3)
    @sides = [l1, l2, l3]
    @first = sides[0]
    @second = sides[1]
    @third = sides[2]
    @kind = return_kind
    raise ArgumentError unless legal?
  end

  def legal?
    sides.none?(0) && valid_lengths?
  end

  def valid_lengths?
    first + second > third &&
    first + third > second &&
    second + third > first
  end

  def return_kind
    qty_lengths = sides.uniq.size

    case qty_lengths
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else        'scalene'
    end
  end

  attr_reader :sides, :first, :second, :third
end