class Integer
  
  NUMERALS = {'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400, 'C' => 100,
              'XC' => 90, 'L' => 50, 'XL' => 40, 'X' => 10, 'IX' => 9,
              'V' => 5, 'IV' => 4, 'I' => 1}
  
  def to_roman
    decimal = self
    roman = ""
    last_key = nil
    
    NUMERALS.each do |key, val|
      dividend, remainder = decimal.divmod(val)
      roman << key * dividend
      decimal = remainder
      last_key = key
    end

    roman
  end
end

# 1550
p 141.to_roman