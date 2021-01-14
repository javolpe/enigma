require_relative './test_helper'
require 'date' 
require 'pry'

class EnigmaTest < Minitest::Test 
  def test_it_exists
    enigma = Enigma.new

    asssert_instance_of Enigma, enigma
  end

end