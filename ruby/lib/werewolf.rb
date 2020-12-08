class Werewolf
  attr_reader :name, :location, :victim_count
  attr_accessor :hunger

  def initialize(name, location = nil)
    @name = name
    @location = location
    @number_of_transformations = 0
    @hunger = false
    @victim_count = 0
  end

  def human?
    @number_of_transformations.even?
  end

  def change!
    @number_of_transformations += 1
  end

  def wolf?
    @number_of_transformations.odd?
  end

  def hunger?
    wolf? === true && victim_count == 0 
  end

  def consumes_victim(victim)
    if wolf? == true
      @victim_count += 1
      victim.dies
      "Munch munch munch"
    else
      "Humans can't eat other humans"
    end
  end
end


class Victim
  attr_accessor :status

  def initialize
    @status = :alive
  end

  def dies
    @status = :dead
  end
end

