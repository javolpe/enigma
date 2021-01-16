require 'date'
require_relative './encrypting_machine'

class Enigma 
  # include Encryptable
  attr_reader :starter_message


  def initialize(message_file)
     @starter_message = get_starter_message(message_file)
  end

  def get_starter_message(message_file)
    unencoded_message = File.read(message_file)
    unencoded_message.downcase
  end

  def generate_five_digit_number
    number = rand.to_s[2..6]
  end

  def generate_date_stamp
    date = Time.now.strftime("%d%m%Y")
    date = date[0..3]+date[6..8]
  end

  def make_starter_array
    code = generate_five_digit_number
    date = generate_date_stamp
    array = [@starter_message, code, date]
  end

  def put_into_encrypting_machine
     start = make_starter_array
     machine = EncryptingMachine.new(start, self)
     encrypted = machine.decide_encryption_path
    final_array = [encrypted]
    final_array << machine.code
    final_array << machine.date
  end

end