require_relative './enigma'

class EncryptingMachine
  attr_reader :plain_message,
              :code,
              :date

  def initialize(message, code, date)
     @plain_message = message
     @code   = code
     @date   = date
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
    code_hash = Hash[keys.zip(values)]
  end

  def encoder_hash(symbol)
    start = base 
    code_hash = shift_hash
    finish = start.rotate(code_hash[symbol])
    encoded_alphabet = Hash[start.zip(finish)]
  end 

  def message_divisible_by_four?
    if @plain_message.length % 4 == 0
      true
    else 
      false
    end
  end

  def decide_encryption_path
    if message_divisible_by_four?
      encrypt_divisible_by_four 
    else 
      encrypt_NOT_divisible_by_four
    end
  end

  def encrypt_divisible_by_four
    split_message = @plain_message.split("")
    x = split_message.length / 4 
    new_message = encrypt_four_letters_at_a_time(split_message, x)
  end

  def encrypt_four_letters_at_a_time(message, x, i=-1)
    new_message = [] 
    x.times do 
      new_message << encode_letter(:A, message[i+=1])
      new_message << encode_letter(:B, message[i+=1])
      new_message << encode_letter(:C, message[i+=1])
      new_message << encode_letter(:D, message[i+=1])
    end
    new_message.join
  end

  def encode_letter(symbol, letter)
    encoder = encoder_hash(symbol)
    if encoder[letter].nil?
      new_letter = letter
    else 
      new_letter = encoder[letter]
    end
  end 

  def encrypt_NOT_divisible_by_four
    x = @plain_message.length % 4
    start_of_message = @plain_message[0..(-x)-1].split("")
    first_half = encrypt_four_letters_at_a_time(start_of_message, start_of_message.length/4)
    end_of_message = @plain_message[-x..-1].split("")
    second_half = encrypt_dynamic_number_of_letters(end_of_message)
    encrypted = first_half + second_half
  end

  def encrypt_dynamic_number_of_letters(end_of_message, i=0)
    sym_array = [:A, :B, :C]
    new_message =[] 
    end_of_message.length.times do 
      new_message << encode_letter(sym_array[i], end_of_message[i])
      i+=1
    end
    new_message.join
  end
end