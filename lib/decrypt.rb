require_relative './enigma'
require 'date'


enigma = Enigma.new

encrypted = File.read(ARGV[0])
decrypted_file = ARGV[1]
key = ARGV[2]
date = ""
if ARGV[3].nil?
  date = Time.now.strftime("%d%m%y")
else 
  date = ARGV[3]
end
enigma.decrypted_message_file = decrypted_file

enigma.decrypt(encrypted, key, date)
