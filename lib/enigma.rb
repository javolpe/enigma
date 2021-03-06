require 'date'
require 'pry'
require_relative './encrypting_machine'
require_relative './decrypting_machine'

class Enigma 
  attr_accessor :message_file,
                :output_file,
                :decrypted_message_file

  def initialize()
     @message_file = ""
     @output_file = ""
     @decrypted_message_file = ""
  end

  def message(message_file = @message_file)
    unencoded_message = File.read(message_file).split("\n")
    unencoded_message[0].downcase
  end


  def generate_code(message_file = @message_file)
    number = rand.to_s[2..6]
    code = File.read(message_file).split("\n")
    if code[1].nil? 
      final = number 
    else 
      final = code[1]
    end
    final
  end

  def generate_date(message_file = @message_file)
    date = Time.now.strftime("%d%m%y")
    code = File.read(message_file).split("\n")
    if code[2].nil? 
      final = date 
    else 
      final = code[2]
    end
    final
  end

  def output_to_file(encrypted)
    File.open(output_file, "w"){|f| f.write "#{encrypted}"}
  end

  
  def encrypt(message, code = generate_code, date = generate_date)
    machine = EncryptingMachine.new(message, code, date)
    encrypted = machine.encrypt_the_message
    output_to_file(encrypted)
    puts "Created '#{output_file}' with the key #{code} and date #{date}"
    final_hash = {encryption: encrypted,
                  key: code,
                  date: date}  
  end

  def output_decrypted_message(decrypted)
    File.open(decrypted_message_file, "w"){|f| f.write "#{decrypted}"}
  end
  
  def decrypt(message, key, date)
    machine = DecryptingMachine.new(message, key, date)
    decrypted = machine.decrypt_the_message
    output_decrypted_message(decrypted)
    puts "Created '#{decrypted_message_file}' with the key #{key} and date #{date}"
    final_hash = {decryption: decrypted,
                  key: key,
                  date: date}
  end

end