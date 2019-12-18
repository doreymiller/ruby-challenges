# algorithm
# create empty results array
# iterate through range of 1 to end_num, not including end_num
# iterate through factors array and multiply factors[i] * range_num and add
# to results array
# add all of elements of unique results array
# return total

class SumOfMultiples
  attr_accessor :factors_arr
  
  DEFAULT_FACTORS = [3, 5]
  
  def initialize(*nums)
    nums = DEFAULT_FACTORS if nums == []
    @factors_arr = nums.to_a
  end
  
  def to(end_num)
    self.class.to(end_num, factors_arr)
  end
  
  def self.to(end_num, factors=DEFAULT_FACTORS)
    results = self.create_multiples(end_num, factors)
    results.uniq.sum
  end
  
  def self.create_multiples(end_num, factors)
    results = []
    (1...end_num).each do |num|
      results << num if factors.any? { |factor| num % factor == 0 }
    end
    results
  end
  
end

x = SumOfMultiples.new
p x.to(20)
SumOfMultiples.to(20)