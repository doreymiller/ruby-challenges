# algorithm
# convert constructor argument to binary and set as @binary_val
# set array of actions as @total_commands and pass in with attr_reader
# set array of @commands as empty array and pass in with attr_accessor
# define method for determining @commands (iterate through array of binary
# digits and if digit == 1 then unshift command from @total_commands to @commands)
# define reverse method to reverse the order of @total_commands if 1 is present
# in 10000 place


class SecretHandshake
  attr_accessor :commands, :total_commands, :binary_digits
  
  def initialize(val)
    @binary_digits = to_binary(val)
    @total_commands = ['jump', 'close your eyes', 'double blink', 'wink']
    @commands = []
    process_commands
  end
  
  def to_binary(val)
    return_arr = val.instance_of?(String) ? str_to_binary(val) : 
                 decimal_to_binary(val)
  end
  
  def decimal_to_binary(val)
    val.to_s(2).chars.map(&:to_i)
  end
  
  def str_to_binary(val)
    val.chars.map(&:to_i)
  end
  
  def process_commands
    reverse = reverse?
    slice_binary_digits
    slice_total_commands
    
    binary_digits.each_with_index do |digit, index|
      commands.unshift(total_commands[index]) if digit == 1
    end
    
    reverse_commands if reverse
  end
  
  def reverse?
    binary_digits.size >= 5 && binary_digits[-5] == 1
  end
  
  def slice_total_commands
    self.total_commands = total_commands[-binary_digits.size..-1]
  end
  
  def slice_binary_digits
    self.binary_digits = binary_digits[-4..-1] if binary_digits.size > 4
  end
  
  def reverse_commands
    commands.reverse!
  end
end

handshake = SecretHandshake.new 9
p handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# p handshake.commands # => ["jump","wink"]

# handshake = SecretHandshake.new(19)
# p handshake.commands # => ["double blink, wink"]

# handshake = SecretHandshake.new(3)
# p handshake.commands # => ["wink", "double blink"]