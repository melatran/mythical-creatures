class Pirate
  attr_reader :name, :job, :cursed, :booty, :patch

  def initialize(name, job = "Scallywag")
    @name = name
    @job = job
    @cursed = 0
    @booty = 0
    @patch = true
  end

  def cursed?
    @cursed >= 3
  end

  def commit_heinous_act
    @cursed += 1
  end

  def rob_ship
    @booty += 100
  end

  def say(message)
    "arrrr #{message}"
  end
end