class Ogre
  attr_reader :name, :home, :encounter_counter, :swings

  def initialize(name, home = "Swamp")
    @name = name
    @home = home
    @encounter_counter = 0
    @swings = 0
  end

  def encounter(human)
    human.encounters_ogre
    @encounter_counter += 1
    if human.notices_ogre?
      swing_at(human)
      human.gets_hit
    end
  end

  def swing_at(human)
    @swings += 1
  end

  def apologize(human)
    human.forgives
  end
end



class Human
  attr_reader :name, :encounter_counter, :passes_out

  def initialize
    @name = "Jane"
    @encounter_counter = 0
    @passes_out = false
  end

  def encounters_ogre
    @encounter_counter += 1
  end

  def notices_ogre?
    @encounter_counter % 3 == 0
  end

  def gets_hit
    @passes_out = true
  end

  def forgives
    @passes_out = false
  end

  def knocked_out?
    @passes_out
  end
end