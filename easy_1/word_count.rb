require 'pry'

class Phrase
  attr_accessor :phrase
  
  def initialize(phrase)
    @phrase = phrase
  end
  
  def word_count
    p words = phrase.downcase.scan(/\b[\w']+\b/)
    words.uniq.each_with_object({}) do |word, results|
      results[word] = words.count(word)
    end
  end
  
end

phrase = Phrase.new("Joe can't tell between 'large' and large.")
p phrase.word_count

phrase = Phrase.new('testing, 1, 2 testing')
p phrase.word_count
