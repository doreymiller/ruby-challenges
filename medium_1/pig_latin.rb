class PigLatin
  
  CONSONANT_GRPS_MOVE = ['ch', 'squ', 'qu', 'th', 'thr', 'sch']
  CONSONANT_GRPS_STAY = ['xr', 'yt']
  
  def self.translate(str)
    words = str.split(" ")
    new_words = []
    words.each { |word| new_words << self.translate_word(word) }
    new_words.join(" ")
  end
  
  def self.starts_with_vowel?(word)
    word[0] =~ /[aeiou]/
  end
  
  def self.letters_to_move(word)
    return_letters = ''
    if CONSONANT_GRPS_MOVE.include?(word[0, 3])
      return_letters = word[0, 3]
    elsif CONSONANT_GRPS_MOVE.include?(word[0, 2])
      return_letters = word[0, 2]
    elsif CONSONANT_GRPS_STAY.include?(word[0, 2])
      return_letters = ''
    else
      return_letters = word[0, 1]
    end
  end
  
  def self.translate_word(word)
    if self.starts_with_vowel?(word)
      new_word = word
    else
      substr = self.letters_to_move(word)
      new_word = word[substr.size..-1] + substr
    end
    new_word + 'ay'
  end
  
  
end

puts PigLatin.translate('quick fast run')