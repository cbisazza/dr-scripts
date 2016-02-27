require 'minitest/autorun'
require 'ostruct'
load 'test/test_harness.rb'

include Harness

class TestSetupConfig < Minitest::Test
  def setup
    # $audible = true
    $history = ['quit']
    load('setupconfig.lic')
  end

  def teardown
    # $audible = false
  end

  def test_saving_sends_loaded_data
    $character_setting = OpenStruct.new(some: 'data')
    $history = ['save']
    SetupConfig.new

    assert_equal({ some: 'data' }, $save_character_profile)
  end

  def test_doesnt_save_on_quit
    $character_setting = OpenStruct.new(some: 'data')
    $history = ['quit']
    SetupConfig.new

    assert_equal(nil, $save_character_profile)
  end
end
