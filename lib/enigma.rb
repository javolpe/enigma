require 'date'
require 'pry'
require_relative './encrypting_machine'

class Enigma 
  attr_reader :starter_message,
              :code


  def initialize(message_file)
     @starter_message = get_starter_message(message_file)
     @code = generate_code(message_file)
     get_it
  end

  def get_starter_message(message_file)
    unencoded_message = File.read(message_file).split("\n")
    unencoded_message[0].downcase
  end

  def generate_code(message_file)
    number = rand.to_s[2..6]
    code = File.read(message_file).split("\n")
    if code[1].nil? || code[1].length != 5
      number 
    else 
      code[1]
    end
  end

  def generate_date
    date = Time.now.strftime("%d%m%Y")
    date = date[0..3]+date[6..8]
  end

  def message 
    @starter_message
  end

  def get_code
    @code
  end

  def get_it
    encrypt(message, code)
  end

  def encrypt(message, code = get_code, date = generate_date)
    machine = EncryptingMachine.new(message, code, date)
    encrypted = machine.decide_encryption_path
    puts "Created some shit with the key #{code} and date #{date} encrypted is #{encrypted}"
    final_hash = {encryption: encrypted,
                  key: code,
                  date: date}
  end
end