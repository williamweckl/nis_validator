class NisValidator::Nis
  def self.valid?(number)
    new(number).valid?
  end

  attr_accessor :number, :x

  def initialize(number = '')
    @number = number.to_s
  end

  def digits
    @digits ||= number.scan(/\d/).map(&:to_i)
  end

  def plain
    @plain ||= digits.join
  end

  def digit
    @digit ||= digits.last
  end

  def identifier
    last_eleven = digits.last(11)
    @identifier ||= last_eleven.join[0..-2]
  end

  def identifier_digits
    @identifier_digits ||= identifier.scan(/\d/).map(&:to_i)
  end

  def valid?
    return false if digits.size < 11
    return false if black_list.include?(number)
    result = (11 - (sum_products % 11))
    true if ((result == digit) || (result == 10 && digit == 0) || (result == 11 && digit == 0))
  end

  private

  def multiply_weights
    @x = []
    i = 0
    [3, 2, 9, 8, 7, 6, 5, 4, 3, 2].each do |weight|
      @x << identifier_digits[i] * weight
      i += 1
    end
  end

  def sum_products
    multiply_weights
    @sum = 0
    10.times do |n|
      @sum += x[n]
    end
    @sum
  end

  def black_list
    %w(000.0000.000-0)
  end
end
