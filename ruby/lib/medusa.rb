class Medusa
  attr_reader :name, :statues

  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(victim)
    @statues << victim
    victim.becomes_stone
    @statues.shift.become_human if @statues.count > 3
  end
end


class Person
  attr_reader :name

  def initialize(name)
    @name = name
    @stoned = false
  end

  def stoned?
    @stoned
  end

  def becomes_stone
    @stoned = true
  end

  def become_human
    @stoned = false
  end
end