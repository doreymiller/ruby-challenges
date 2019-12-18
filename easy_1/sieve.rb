# sieve.rb

# class Sieve
  
#   UNMARKED = "unmarked"
#   MARKED = "marked"
  
#   def initialize(num)
#     @sieve_num = num
#     @nums_hsh = (2..@sieve_num).to_h { |num| [num, UNMARKED] }
#     @current_num = 1
#   end
  
#   def primes
    
#     loop do
#       @current_num = next_unmarked_num
#       break unless @current_num
#       mark_multiples
#     end
    
#     @nums_hsh.select { |k, v| v == UNMARKED }.keys
#   end
  
#   def mark_multiples
#     (2..@sieve_num).each do |num|
#       multiple = num * @current_num
#       break if multiple > @sieve_num
#       mark(multiple)
#     end
#   end
  
#   def next_unmarked_num
#     @nums_hsh.select { |k,_| !marked?(k) && k > @current_num }.keys.first
#   end
  
#   def mark(key)
#     @nums_hsh[key] = MARKED
#   end
  
#   def marked?(key)
#     @nums_hsh[key] == MARKED
#   end
  
  
# end

class Sieve
  
  def initialize(limit)
    @nums_arr = (2..limit).to_a
  end
  
  def primes
    prime_nums = []
    until @nums_arr.empty?
      prime_nums << @nums_arr.shift
      @nums_arr.reject! { |num| num % prime_nums.last == 0 }
    end
    prime_nums
  end
end


p Sieve.new(10).primes #== [2, 3, 5, 7]
   