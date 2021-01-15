require 'date'
require_relative './encryption_module'

class Enigma 
  # include Encryptable
  attr_reader :starter_message


  def initialize(arg1)
     @starter_message = get_starter_message(arg1)
  end

  def get_starter_message(arg)
    new_file = File.read(arg)
  end

  def generate_five_digit_number
    number = rand.to_s[2..6]
  end

  def make_starter_array
    code = generate_five_digit_number
    array = [@starter_message, code]
  end

end