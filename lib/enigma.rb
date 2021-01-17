require 'date'
require 'pry'
require_relative './encrypting_machine'

class Enigma 
  attr_reader :starter_message,
              :output_file,
              :message_file

  def initialize(message_file, writer_file)
     @starter_message = get_starter_message(message_file)
     @output_file = writer_file
     @message_file = message_file
     get_it
  end

  def get_starter_message(message_file)
    unencoded_message = File.read(message_file).split("\n")
    unencoded_message[0].downcase
  end

  def generate_code(message_file)
    number = rand.to_s[2..6]
    code = File.read(message_file).split("\n")
    if code[1].nil? 
      final = number 
    else 
      final = code[1]
    end
    final
  end

  def generate_date
    date = Time.now.strftime("%d%m%y")
    code = File.read(message_file).split("\n")
    if code[2].nil? 
      final = date 
    else 
      final = code[2]
    end
    final
  end

  def message 
    @starter_message
  end

  def get_code
    generate_code(message_file)
  end

  def get_it
    encrypt(message)
  end

  def output_to_file(encrypted, code, date)
    File.open(output_file, "w"){|f| f.write "#{encrypted} \n#{code} \n#{date}"}
  end

  def encrypt(message, code = get_code, date = generate_date)
    machine = EncryptingMachine.new(message, code, date)
    encrypted = machine.encrypt_the_message
    output_to_file(encrypted, code, date)
    puts "Created #{encrypted} with the key #{code} and date #{date}"
    final_hash = {encryption: encrypted,
                  key: code,
                  date: date}
  end
end