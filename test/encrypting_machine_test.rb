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
    machine = EncryptingMachine.new(["hello world", "09547", "150121"], enigma)

    assert_equal Array, machine.base.class 
    assert_equal "a", machine.base[0]
    assert_equal 27, machine.base.count
  end

  def test_shifter
    enigma = mock
    machine = EncryptingMachine.new(["hello world", "09547", "150121"], enigma)

    assert_equal "4641", machine.shifter
  end

  def test_shift_hash
    enigma = mock
    machine = EncryptingMachine.new(["hello world", "09547", "150121"], enigma)

    expected = {:A => 13,
                :B => 101,
                :C => 58,
                :D => 48
                }
    
    assert_equal expected, machine.shift_hash
  end

  def test_a_shift
    enigma = mock
    machine = EncryptingMachine.new(["hello world", "09547", "150121"], enigma)

    assert_equal Hash, machine.a_shift.class
    assert_equal String, machine.a_shift.class[:A]
    assert_equal 27, machine.a_shift.count
  end
end