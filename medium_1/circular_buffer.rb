class CircularBuffer
  attr_accessor :buffer, :size
  
  def initialize(size)
    @buffer = []
    @size = size
  end
  
  def write(element)
    write_to_buffer(element) { raise BufferFullException }
  end
  
  def full?
    buffer.size == size
  end

  def write_to_buffer(val)
    return if val == nil
    yield if full?
    buffer << val
  end
  
  def write!(element)
    write_to_buffer(element) { buffer.shift }
  end
  
  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end
  
  def clear
    self.buffer = []
  end
  
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
