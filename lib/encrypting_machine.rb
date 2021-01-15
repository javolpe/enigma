require_relative './enigma'

class EncryptingMachine
  def initialize(array, enigma)
     @plain_message = array[0]
     @enigma = enigma
  end
end