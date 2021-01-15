require_relative './test_helper'
require 'date' 
require 'pry'
require './lib/enigma'

class EnigmaTest < Minitest::Test 
  def test_it_exists
    enigma = Enigma.new("hello world")

    assert_instance_of Enigma, enigma
    assert_equal "hello world", enigma.starter_message
  end

  def test_read_initial_message
    enigma = Enigma.new(./lib/message.txt)

    "hello world", enigma.starter_message
  end

end