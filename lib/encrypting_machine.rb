require_relative './enigma'

class EncryptingMachine
  attr_reader :plain_message,
              :code,
              :date,
              :enigma

  def initialize(array, enigma)
     @plain_message = array[0]
     @code   = array[1]
     @date   = array[2]
     @enigma = enigma
  end

  def base 
    start = ("a".."z").to_a << " "
  end

  def shifter
    date_integer = @date.to_i
    squared = date_integer * date_integer
    final = squared.to_s[-4..-1]
  end

  def shift_hash
    

  end

  
end