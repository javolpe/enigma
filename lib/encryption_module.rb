module  Encryptable

  def base 
    start = ("a".."z").to_a << " "
  end

  def offsets
    date_integer = @date.to_i
    squared = date_integer * date_integer
    final = squared.to_s[-4..-1]
  end

  def encoder_hash(symbol)
    start = base 
    code_hash = key_shift_hash
    finish = start.rotate(code_hash[symbol])
    encoded_alphabet = Hash[start.zip(finish)]
  end 

  def keep_sym_under_three(sym)
    if sym >= 3
       sym = 0
    else 
      sym +=1
    end
  end

  def encode_letter(symbol, letter)
    encoder = encoder_hash(symbol)
    if encoder[letter].nil?
      new_letter = letter
    else 
      new_letter = encoder[letter]
    end
  end 

  
end