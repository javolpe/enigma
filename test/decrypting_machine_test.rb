require_relative './test_helper'
require 'date' 
require 'pry'
require './lib/enigma'
require './lib/decrypting_machine'
require 'mocha/minitest'


class EncryptingMachineTest < Minitest::Test 
  def test_it_exists_and_has_attributes
    machine = DecryptingMachine.new("xbbxdxm giu!", "94687", "031756")

    assert_instance_of DecryptingMachine, machine
    assert_equal "xbbxdxm giu!", machine.plain_message
    assert_equal "94687", machine.code
    assert_equal "031756", machine.date
  end

  def test_base
    machine = DecryptingMachine.new("xbbxdxm giu!", "94687", "031756")

    assert_equal Array, machine.base.class 
    assert_equal "a", machine.base[0]
    assert_equal 27, machine.base.count
  end

  def test_shifter
    machine = DecryptingMachine.new("xbbxdxm giu!", "94687", "031756")

    assert_equal "3536", machine.shifter
    assert_equal String, machine.shifter.class
    assert_equal 4, machine.shifter.length
  end

  def test_shift_hash
    machine = DecryptingMachine.new("xbbxdxm giu!", "94687", "031756")

    expected = {:A => -97,
                :B => -51,
                :C => -71,
                :D => -93
                }
    
    assert_equal expected, machine.shift_hash
    assert_equal Hash, machine.shift_hash.class
  end

  def test_encoder_hash
    machine = DecryptingMachine.new("xbbxdxm giu!", "94687", "031756")

    assert_equal Hash, machine.encoder_hash(:A).class
    assert_equal String, machine.encoder_hash(:B)["a"].class
    assert_equal "l", machine.encoder_hash(:A)["a"]
    assert_equal "d", machine.encoder_hash(:B)["a"]
    assert_equal "j", machine.encoder_hash(:C)[" "]
    assert_equal "q", machine.encoder_hash(:D)["b"]
    assert_equal 27, machine.encoder_hash(:A).count
  end

  def test_encode_letter
    machine = DecryptingMachine.new("xbbxdxm giu!", "94687", "031756")

    assert_equal "l", machine.encode_letter(:A, "a")
    assert_equal "d", machine.encode_letter(:B, "a")
    assert_equal "j", machine.encode_letter(:C, " ")
    assert_equal "q", machine.encode_letter(:D, "b")
  end

  def test_decrypt_the_message
    machine = DecryptingMachine.new("xbbxdxm giu", "94687", "031756")

    assert_equal "hello world", machine.decrypt_the_message
  end


  def test_decrypt_the_message_exclamation_point
    machine = DecryptingMachine.new("xbbxdxm giu!", "94687", "031756")

    assert_equal "hello world!", machine.decrypt_the_message
  end

  def test_decrypt_the_message_new_code_and_date
    machine = DecryptingMachine.new"keder ohulw!", "02715", "040895"

    assert_equal "hello world!", machine.decrypt_the_message
  end

  def test_encrypt_the_message_added_letters_symbols
    machine = DecryptingMachine.new("uypfat ideh!nn@", "09547", "150121")

    assert_equal "hello world!au@", machine.decrypt_the_message
  end

  def test_keep_sym_under_three
    machine = EncryptingMachine.new("hello world!au@", "09547", "150121")

    assert_equal 1, machine.keep_sym_under_three(0)
    assert_equal 2, machine.keep_sym_under_three(1)
    assert_equal 0, machine.keep_sym_under_three(3)
  end
end