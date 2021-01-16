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
    shift = shifter
    keys = [:A, :B, :C, :D]
    values = [@code[0..1].to_i + shift[0].to_i, @code[1..2].to_i + shift[1].to_i]
    values << (@code[2..3].to_i + shift[2].to_i)
    values << (@code[3..4].to_i + shift[3].to_i)
    secret_hash = Hash[keys.zip(values)]
  end

  
  def encoder_hash(symbol)
    start = base 
    secret_hash = shift_hash
    finish = start.rotate(secret_hash[symbol])
    encoded_alphabet = Hash[start.zip(finish)]
  end 
end