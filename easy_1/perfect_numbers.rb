class PerfectNumber
  
  def self.classify(number)
    raise RuntimeError if number < 1
    
    sum = self.sum_of_divisors(number)
    number_type(number, sum)
  end
  
  def self.number_type(number, sum)
    return "perfect" if sum == number
    return "abundant" if sum > number
    return "deficient" if sum < number
  end
  
  def self.sum_of_divisors(number)
    (1..(number / 2)).to_a.select { |num| number % num == 0 }.sum
  end
end