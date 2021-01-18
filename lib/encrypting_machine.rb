require_relative './enigma'
require_relative './encryption_module'

class EncryptingMachine
  include Encryptable

  attr_reader :plain_message,
              :code,
              :date

  def initialize(message, code, date)
     @plain_message = message
     @code   = code
     @date   = date
  end

  # def base 
  #   start = ("a".."z").to_a << " "
  # end

  # def shifter
  #   date_integer = @date.to_i
  #   squared = date_integer * date_integer
  #   final = squared.to_s[-4..-1]
  # end

  def shift_hash
    shift = shifter
    keys = [:A, :B, :C, :D]
    values = [@code[0..1].to_i + shift[0].to_i, @code[1..2].to_i + shift[1].to_i]
    values << (@code[2..3].to_i + shift[2].to_i)
    values << (@code[3..4].to_i + shift[3].to_i)
    code_hash = Hash[keys.zip(values)]
  end

  # def encoder_hash(symbol)
  #   start = base 
  #   code_hash = shift_hash
  #   finish = start.rotate(code_hash[symbol])
  #   encoded_alphabet = Hash[start.zip(finish)]
  # end 

  def encrypt_the_message(i = -1)
    sym = 0
    sym_array = [:A, :B, :C, :D]
    new_message = []
    split_message = @plain_message.split("")
    split_message.length.times do 
      new_message << encode_letter(sym_array[sym], split_message[i+=1])
      sym = keep_sym_under_three(sym)
    end
    new_message.join
  end

  # def keep_sym_under_three(sym)
  #   if sym >= 3
  #      sym = 0
  #   else 
  #     sym +=1
  #   end
  # end

  # def encode_letter(symbol, letter)
  #   encoder = encoder_hash(symbol)
  #   if encoder[letter].nil?
  #     new_letter = letter
  #   else 
  #     new_letter = encoder[letter]
  #   end
  # end 
end