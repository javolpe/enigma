require 'date'
require_relative './encrypting_machine'

class Enigma 
  attr_reader :starter_message


  def initialize(message_file)
     @starter_message = get_starter_message(message_file)
  end

  def get_starter_message(message_file)
    unencoded_message = File.read(message_file).split("\n")
    unencoded_message[0].downcase
  end

  def generate_code
    number = rand.to_s[2..6]
  end

  def generate_date
    date = Time.now.strftime("%d%m%Y")
    date = date[0..3]+date[6..8]
  end

  def message 
    @starter_message
  end

  def encrypt(message, code = generate_code, date = generate_date)
    machine = EncryptingMachine.new(message, code, date)
    encrypted = machine.decide_encryption_path
    final_hash = {encryption: encrypted,
                  key: code,
                  date: date}
  end

end