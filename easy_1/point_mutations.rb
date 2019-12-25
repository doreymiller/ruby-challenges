class DNA
  attr_reader :strand
  
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(distance)
    strands = [strand.chars, distance.chars].sort { |a,b| a.size <=> b.size }
    matches = strands[0].each_with_index.select do | letter, index |
      letter == strands[1][index]
    end
    strands[0].size - matches.size
  end
end

p DNA.new('ACT').hamming_distance('GGA')