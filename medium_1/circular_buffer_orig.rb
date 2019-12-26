class CircularBuffer
  attr_accessor :buffer, :indexes
  
  def initialize(size)
    @buffer = Array.new(size)
    @indexes = []
  end
  
  def write(element, force=false)
    return if element == nil
    if buffer_empty?
      write_to_buffer(element, 0)
    elsif buffer[next_buffer_index] == nil || force
      write_to_buffer(element, next_buffer_index)
    else
      raise BufferFullException, "Buffer is Full"
    end
  end
  
  def buffer_empty?
    indexes.empty?
  end
  
  def next_buffer_index
    (indexes.last + 1) % buffer.size
  end
  
  def write_to_buffer(val, index)
    buffer[index] = val
    remove_index(index)
    indexes << index
  end
  
  def write!(element)
    write(element, true) if element
  end
  
  def remove_index(index)
    indexes.delete(index)
  end
  
  def read
    raise BufferEmptyException if indexes.empty?
    read_index = indexes.shift
    read_val = buffer[read_index]
    buffer[read_index] = nil
    read_val
  end
  
  def clear
    indexes.each { |index| buffer[index] = nil }
    self.indexes = []
  end
  
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end

buffer = CircularBuffer.new(2)
buffer.write '1'
buffer.write '2'
buffer.write! 'A'
p buffer.read
p buffer.read
