require_relative './test_helper'
require 'date' 
require 'pry'
require './lib/enigma'
require './lib/encrypting_machine'

class EncryptingMachineTest < Minitest::Test 
  def test_it_exists_and_has_attributes
    machine = EncryptingMachine.new(["hello world", "09547", "150121"])

    assert_instance_of EncryptingMachine, machine
  end
end