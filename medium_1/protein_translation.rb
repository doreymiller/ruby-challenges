class InvalidCodonError < StandardError
end

class Translation

  PROTEINS = {"Methionine" => ["AUG"], "Phenylalanine" => ["UUU", "UUC"],
              "Leucine"=> ["UUA", "UUG"],
              "Serine" => ["UCU", "UCC", "UCA", "UCG"],
              "Tyrosine" => ["UAU", "UAC"], "Cysteine" => ["UGU", "UGC"],
              "Tryptophan" => ["UGG"], "STOP" => ["UAA", "UAG", "UGA"]
  }
  
  def self.of_codon(codon)
    self.codon_error unless self.valid_codon?(codon)
    self.protein_match(codon)
  end
  
  def self.protein_match(codon)
    PROTEINS.select { |key, val| val.include?(codon) }.keys.first
  end
  
  def self.valid_codon?(codon)
    PROTEINS.values.flatten.include?(codon)
  end
  
  def self.codon_error
    raise InvalidCodonError.new "Invalid Codon"
  end
  
  def self.of_rna(strand)
    codon_arr = strand.scan(/.../)
    codon_arr.each_with_object([]) do |codon, proteins|
      protein = self.of_codon(codon)
      return proteins if protein == "STOP"
      proteins << protein
    end
  end
end

p Translation.of_codon('UUU')
p Translation.of_codon('AUG')