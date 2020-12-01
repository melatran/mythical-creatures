class Wizard
  attr_reader :name, :beared, :spells_casted

  def initialize(name, bearded: true)
    @name = name
    @bearded = bearded
    @spells_casted = 0
  end

  def rested?
    @spells_casted < 3
  end

  def bearded?
    @bearded
  end

  def incantation(root_powers)
    "sudo #{root_powers}"
  end

  def cast(spell)
    @spells_casted += 1
    return "#{spell}!"
  end
end