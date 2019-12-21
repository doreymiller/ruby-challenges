require 'pry'

class Luhn
  attr_accessor :checksum, :addends, :number

  def initialize(num)
    @number = num
    @addends = Luhn.create_addends(num)
    @checksum = addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create_addends(num)
    digits = Luhn.create_digits_array(num)
    addends_arr = digits.reverse.each_with_index.map do |digit, index|
      val = index.odd? ? digit * 2 : digit
      val >= 10 ? val - 9 : val
    end
    addends_arr.reverse
  end

  def ==(other)
    valid? && other_card.valid?
  end

  def self.create_digits_array(num)
    num.to_s.chars.map(&:to_i)
  end

  def self.digits_arr_to_number(arr)
    arr.map(&:to_s).join.to_i
  end

  def self.create(num)
    new_num = num * 10
    new_luhn = new(new_num)
    if new_luhn.valid?
      new_num
    else
      remainder = new_luhn.checksum % 10
      new_num + 10 - remainder
    end
  end
end
