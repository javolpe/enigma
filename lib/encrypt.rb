require_relative './enigma'

enigma = Enigma.new
message  = enigma.message(ARGV[0])
code = enigma.generate_code(ARGV[0])
date = enigma.generate_date(ARGV[0])
enigma.message_file = ARGV[0]

enigma.output_file = ARGV[1]

enigma.encrypt(message)
