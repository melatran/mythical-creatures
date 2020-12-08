gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/werewolf'

class WerewolfTest < Minitest::Test
  def test_it_has_a_name
    werewolf = Werewolf.new("Remus")
    assert_equal "Remus", werewolf.name
  end

  def test_it_has_a_location
    werewolf = Werewolf.new("Remus","London")
    assert_equal "London", werewolf.location
  end

  def test_it_is_by_default_in_human_form
    werewolf = Werewolf.new("Remus","London")
    assert werewolf.human?
  end

  def test_when_starting_as_a_human_changing_means_it_is_no_longer_human
    werewolf = Werewolf.new("Remus","London")
    werewolf.change!
    refute werewolf.human?
  end

  def test_when_starting_as_a_human_changing_turns_it_into_a_werewolf
    werewolf = Werewolf.new("Remus","London")
    werewolf.change!
    assert werewolf.wolf?
  end

  def test_when_starting_as_a_human_changing_a_second_time_it_becomes_human_again
    #even = human
    werewolf = Werewolf.new("Remus","London")
    assert werewolf.human?
    werewolf.change!
    werewolf.change!
    assert werewolf.human?
  end

  def test_when_starting_as_a_werewolf_changing_a_second_time_it_becomes_werewolf_again
    #odd = werewolf
    werewolf = Werewolf.new("Remus","London")
    werewolf.change!
    assert werewolf.wolf?
    werewolf.change!
    werewolf.change!
    assert werewolf.wolf?
  end

  def test_is_not_hungry_by_default
    werewolf = Werewolf.new("Remus","London")
    assert_equal false, werewolf.hunger
  end

  def test_becomes_hungry_after_changing_to_a_werewolf
    werewolf = Werewolf.new("Remus","London")
    werewolf.change!
    assert_equal true, werewolf.hunger?
  end

  def test_consumes_a_victim
    werewolf = Werewolf.new("Remus","London")
    victim = Victim.new
    assert_equal 0, werewolf.victim_count
    werewolf.change!
    werewolf.consumes_victim(victim)
    assert_equal 1, werewolf.victim_count
  end
  
  def test_cannot_consume_victim_if_in_human_form
    werewolf = Werewolf.new("Remus","London")
    victim = Victim.new
    assert_equal false, werewolf.hunger?
    assert_equal "Humans can't eat other humans", werewolf.consumes_victim(victim)
    assert_equal 0, werewolf.victim_count
  end

  def test_a_werewolf_who_has_consumed_a_victim_is_no_longer_hungry
    werewolf = Werewolf.new("Remus","London")
    victim = Victim.new
    werewolf.change!
    assert_equal true, werewolf.hunger?
    werewolf.consumes_victim(victim)
    assert_equal false, werewolf.hunger?
  end

  def test_a_werewolf_who_has_consumed_a_victim_makes_the_victim_dead
    werewolf = Werewolf.new("Remus","London")
    victim = Victim.new
    werewolf.change!
    werewolf.consumes_victim(victim)
    assert_equal :dead, victim.status
  end
end
