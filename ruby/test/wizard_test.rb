gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/wizard'

class WizardTest < Minitest::Test
  def test_has_name
    wizard = Wizard.new("Eric")
    assert_equal "Eric", wizard.name
  end

  def test_can_have_different_name
    wizard = Wizard.new("Alex")
    assert_equal "Alex", wizard.name
  end

  def test_is_bearded_by_default
    wizard = Wizard.new("Ben")
    assert wizard.bearded?
  end

  def test_is_not_always_bearded
    wizard = Wizard.new("Valerie", bearded: false)
    assert_equal false, wizard.bearded?
  end

  def test_has_root_powers
    wizard = Wizard.new("Sarah", bearded: false)
    assert_equal "sudo chown ~/bin", wizard.incantation("chown ~/bin")
  end

  def test_has_lots_of_root_powers
    wizard = Wizard.new("Rob", bearded: false)
    assert_equal "sudo rm -rf /home/mirandax", wizard.incantation("rm -rf /home/mirandax")
  end

  def test_starts_rested
    # create wizard
    # .rested? returns true
    wizard = Wizard.new("Dumbledore")
    assert_equal true, wizard.rested?
  end

  def test_can_cast_spells
    # create wizard
    # .cast returns "MAGIC MISSILE!"
    wizard = Wizard.new("Dumbledore")
    assert_equal "MAGIC MISSILE!", wizard.cast("MAGIC MISSILE")
  end

  def test_gets_tired_after_casting_three_spells
    # create wizard
    # casts spell twice
    # check wizard is rested
    # casts spell
    # check wizard is not rested
    wizard = Wizard.new("Dumbledore")
    wizard.cast("MAGIC MISSILE")
    assert_equal true, wizard.rested?
    wizard.cast("Expelliarmus")
    assert_equal true, wizard.rested?
    wizard.cast("Avada Kedavra")
    assert_equal false, wizard.rested?
  end

end

