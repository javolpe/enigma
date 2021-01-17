require_relative './test_helper'
require 'date' 
require 'pry'
require './lib/enigma'


class EnigmaTest < Minitest::Test 
  def test_it_exists
    enigma = Enigma.new("./interaction_inputs.txt")

    assert_instance_of Enigma, enigma
    assert_equal "hello world!", enigma.starter_message
  end

  def test_get_starter_message
    enigma = Enigma.new("./interaction_inputs.txt")

    assert_equal  "hello world!", enigma.get_starter_message("./interaction_inputs.txt")
  end

  def test_generate_code
    enigma = Enigma.new("./interaction_inputs.txt")

    assert_equal "02715", enigma.generate_code("./interaction_inputs.txt")
    assert_equal 5, enigma.generate_code("./interaction_inputs.txt").length
  end

  def test_generate_code_auto_gen
    enigma = Enigma.new("./test_only_message.txt")

    assert_equal String, enigma.generate_code("./interaction_inputs.txt").class
    assert_equal 5, enigma.generate_code("./interaction_inputs.txt").length
  end

  def test_message 
    enigma = Enigma.new("./interaction_inputs.txt")

    assert_equal "hello world!", enigma.message
  end

  def test_generate_date_given_date
    enigma = Enigma.new("./interaction_inputs.txt")


    assert_equal "95", enigma.generate_date[-2..-1]
    assert_equal String, enigma.generate_date.class
    assert_equal 6, enigma.generate_date.length
  end

  def test_generate_date_no_date_given
    enigma = Enigma.new("./test_no_date.txt")


    assert_equal "21", enigma.generate_date[-2..-1]
    assert_equal String, enigma.generate_date.class
    assert_equal 6, enigma.generate_date.length
  end

  def test_encrypt_the_message
    enigma = Enigma.new("./interaction_inputs.txt")
    expected = {
          encryption: "keder ohulw!",
          key: "02715",
          date: "040895"
        }

    assert_equal expected, enigma.encrypt("hello world!", "02715", "040895") 
  end

  # def test_encrypt_the_message_no_date_given
  #   enigma = Enigma.new("./message.txt")
  #   expected = {
  #     encryption: "nkfaufqdxry!",
  #     key: "02715",
  #     date: "160121"
  #   }

  #   assert_equal expected, enigma.encrypt("hello world!", "02715")
  # end

  # def test_encrypt_NOT_divisible_by_four_no_date
  #   enigma = Enigma.new("./message.txt")
  #   expected = {
  #     encryption: "nkfaufqdxry",
  #     key: "02715",
  #     date: "160121"
  #   }

  #   assert_equal expected, enigma.encrypt("hello world", "02715")
  # end
end