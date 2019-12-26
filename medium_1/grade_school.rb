class School
  attr_accessor :classes
  
  def initialize
    @classes = {}
  end
  
  def add(name, grade_num)
    classes[grade_num] = [] unless classes.has_key?(grade_num)
    classes[grade_num].push(name).sort!
  end
  
  def grade(grade_num)
    return [] unless classes.has_key?(grade_num)
    classes[grade_num]
  end
    
  def to_h
    classes.sort.to_h
  end
end