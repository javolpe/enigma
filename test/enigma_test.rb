require_relative './test_helper'
require 'date' 
require 'pry'
require './lib/enigma'


class EnigmaTest < Minitest::Test 
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_message
    enigma = Enigma.new

    assert_equal  "hello world!", enigma.message("./test_only_message.txt")
  end

  def test_generate_code
    enigma = Enigma.new

    assert_equal "02715", enigma.generate_code("./test_no_date.txt")
    assert_equal 5, enigma.generate_code("./interaction_inputs.txt").length
  end

  def test_generate_code_auto_gen
    enigma = Enigma.new

    assert_equal String, enigma.generate_code("./test_only_message.txt").class
    assert_equal 5, enigma.generate_code("./test_only_message.txt").length
  end

  def test_generate_date_given_date
    enigma = Enigma.new


    assert_equal "040895", enigma.generate_date("./interaction_inputs.txt")
    assert_equal String, enigma.generate_date("./interaction_inputs.txt").class
    assert_equal 6, enigma.generate_date("./interaction_inputs.txt").length
  end

  def test_generate_date_no_date_given
    enigma = Enigma.new


    assert_equal "21", enigma.generate_date("./test_no_date.txt")[-2..-1]
    assert_equal String, enigma.generate_date("./test_no_date.txt").class
    assert_equal 6, enigma.generate_date("./test_no_date.txt").length
  end

  def test_output_to_file
    enigma = Enigma.new
    enigma.output_file = "./decrypted.txt"

    assert_equal 3, enigma.output_to_file("cat")
  end

  def test_encrypt_the_message
    enigma = Enigma.new
    enigma.output_file = "./decrypted.txt"
    expected = {
          encryption: "keder ohulw!",
          key: "02715",
          date: "040895"
        }

    assert_equal expected, enigma.encrypt("hello world!", "02715", "040895") 
  end

  def test_output_decrypted_message 
    enigma = Enigma.new
    enigma.decrypted_message_file = "./decrypted.txt"

    assert_equal 3, enigma.output_decrypted_message("cat")
  end

  def test_decrypt 
    enigma = Enigma.new
    enigma.decrypted_message_file = "./decrypted.txt"
    expected = {
          decryption: "hello world",
          key: "02715",
          date: "040895"
        }
    
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end
end