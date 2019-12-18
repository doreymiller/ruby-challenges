# octal.rb

class Octal
  
  BASE = 8
  
  def initialize(str)
    @conversion_str = str
    remove_starter_zeros
  end
  
  def to_decimal
    return 0 if invalid?
    nums = str_to_digits
    total = 0
    
    nums.each_with_index do |num, index|
      total += num * BASE**index
      index
    end
     
   total
  end
  
  def str_to_digits
    @conversion_str.chars.reverse.map(&:to_i)
  end
  
  def remove_starter_zeros
    while @conversion_str[0] == '0'
      @conversion_str = @conversion_str.slice!(1..-1)
    end
  end
  
  def invalid?
    @conversion_str =~ /[a..z89]/
  end
  
end

o = Octal.new('011')
p o.to_decimal