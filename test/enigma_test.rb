require_relative './test_helper'
require 'date' 
require 'pry'
require './lib/enigma'


class EnigmaTest < Minitest::Test 
  def test_it_exists
    enigma = Enigma.new("./message.txt")

    assert_instance_of Enigma, enigma
    assert_equal "hello world", enigma.starter_message
  end

  def test_read_initial_message
    enigma = Enigma.new("./message.txt")

    assert_equal  "hello world", enigma.starter_message
  end

  def test_generate_five_digit_number
    enigma = Enigma.new("./message.txt")

    assert_equal String, enigma.generate_five_digit_number.class
    assert_equal 5, enigma.generate_five_digit_number.length
  end

  def test_generate_date_stamp
    enigma = Enigma.new("./message.txt")


    assert_equal "21", enigma.generate_date_stamp[-2..-1]
    assert_equal String, enigma.generate_date_stamp.class
    assert_equal 6, enigma.generate_date_stamp.length
  end

  def test_make_starter_array
    enigma = Enigma.new("./message.txt")

    assert_equal Array, enigma.make_starter_array.class
    assert_equal String, enigma.make_starter_array[0].class
    assert_equal String, enigma.make_starter_array[1].class
    assert_equal 3, enigma.make_starter_array.count
  end

end