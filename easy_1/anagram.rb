class Anagram
  attr_reader :word
  
  def initialize(word)
    @word = word
  end
  
  def same_letters?(other_word)
    word.downcase.chars.sort == other_word.downcase.chars.sort
  end
  
  def match(list)
    list.each_with_object([]) do |wd, arr| 
      next if wd.downcase == word
      arr << wd if same_letters?(wd) 
    end
  end
end

detector = Anagram.new('diaper')
p detector.match(%w(hello world zombies pants))