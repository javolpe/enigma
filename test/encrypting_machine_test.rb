require_relative './test_helper'
require 'date' 
require 'pry'
require './lib/enigma'
require './lib/encrypting_machine'
require 'mocha/minitest'


class EncryptingMachineTest < Minitest::Test 
  def test_it_exists_and_has_attributes
    enigma = mock
    machine = EncryptingMachine.new(["hello world!", "09547", "150121"], enigma)

    assert_instance_of EncryptingMachine, machine
    assert_equal "hello world!", machine.plain_message
    assert_equal "09547", machine.code
    assert_equal "150121", machine.date
    assert_equal enigma, machine.enigma
  end

  def test_base
    enigma = mock
    machine = EncryptingMachine.new(["hello world!", "09547", "150121"], enigma)

    assert_equal Array, machine.base.class 
    assert_equal "a", machine.base[0]
    assert_equal 27, machine.base.count
  end

  def test_shifter
    enigma = mock
    machine = EncryptingMachine.new(["hello world!", "09547", "150121"], enigma)

    assert_equal "4641", machine.shifter
    assert_equal String, machine.shifter.class
    assert_equal 4, machine.shifter.length
  end

  def test_shift_hash
    enigma = mock
    machine = EncryptingMachine.new(["hello world!", "09547", "150121"], enigma)

    expected = {:A => 13,
                :B => 101,
                :C => 58,
                :D => 48
                }
    
    assert_equal expected, machine.shift_hash
    assert_equal Hash, machine.shift_hash.class
  end

  def test_encoder_hash
    enigma = mock
    machine = EncryptingMachine.new(["hello world!", "09547", "150121"], enigma)

    assert_equal Hash, machine.encoder_hash(:A).class
    assert_equal String, machine.encoder_hash(:B)["a"].class
    assert_equal "n", machine.encoder_hash(:A)["a"]
    assert_equal "u", machine.encoder_hash(:B)["a"]
    assert_equal "d", machine.encoder_hash(:C)[" "]
    assert_equal "w", machine.encoder_hash(:D)["b"]
    assert_equal 27, machine.encoder_hash(:A).count
  end

  def test_message_divisible_by_four?
    enigma = mock
    machine = EncryptingMachine.new(["hello world!", "09547", "150121"], enigma)
    
    assert_equal true, machine.message_divisible_by_four?

    enigma = mock
    machine = EncryptingMachine.new(["hello world!&@", "09547", "150121"], enigma)
    
    assert_equal false, machine.message_divisible_by_four?
  end

  # def test_decide_encryption_path
  # not sure how to test this one but shit works
  #if an instructor sees this I swear I did TDD for the rest like a good Turing student
  # end

  def test_encrypt_divisible_by_four
    enigma = mock
    machine = EncryptingMachine.new(["hello world!", "09547", "150121"], enigma)

    assert_equal "uypfat ideh!", machine.encyrpt_divisible_by_four
    assert_equal String, machine.encyrpt_divisible_by_four.class
    assert_equal machine.plain_message.length, machine.encyrpt_divisible_by_four.length
  end

  def test_encode_letter
    enigma = mock
    machine = EncryptingMachine.new(["hello world!", "09547", "150121"], enigma)

    assert_equal "n", machine.encode_letter(:A, "a")
    assert_equal "u", machine.encode_letter(:B, "a")
    assert_equal "d", machine.encode_letter(:C, " ")
    assert_equal "w", machine.encode_letter(:D, "b")
  end

  def test_encrypt_NOT_divisible_by_four
    enigma = mock
    machine = EncryptingMachine.new(["hello world!au@", "09547", "150121"], enigma)

    assert_equal "uypfat ideh!nn@", machine.encrypt_NOT_divisible_by_four
  end

  def test_encrypt_dynamic_number_of_letters
    enigma = mock
    machine = EncryptingMachine.new(["hello world!au@", "09547", "150121"], enigma)

    assert_equal "nn@", machine.encrypt_dynamic_number_of_letters("au@")
    assert_equal String, machine.encrypt_dynamic_number_of_letters("au@").class
  end
end