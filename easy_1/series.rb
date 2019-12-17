# Write a program that will take a string of digits and give you all the possible
# consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234
#And the following 4-digit series:

# - 0123
# - 1234
# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever
# you get.

class Series
  
  def initialize(series_str)
    @str = series_str
    @nums = @str.chars.map(&:to_i)
  end
  
  def slices(num)
    verify_input(num)
    results = []
    @nums.each_cons(num) do |set|
      results << set
    end
    results
  end
  
  def verify_input(num)
     raise ArgumentError, "Your slice number is too big!" if num > @nums.size
  end
end

my_set = Series.new('01234')
p my_set.slices(2)