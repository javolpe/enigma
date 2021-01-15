require_relative './test_helper'
require 'date' 
require 'pry'
require './lib/enigma'

class EnigmaTest < Minitest::Test 
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

end