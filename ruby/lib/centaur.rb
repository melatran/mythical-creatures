class Centaur
  attr_reader :name, :breed
  attr_accessor :action_counts

  def initialize(name, breed)
    @name = name
    @breed = breed
    @is_standing = true
    @action_counts = 0
    @health_levels = 0
  end
  
  def cranky?
    @action_counts >= 3
  end

  def shoot
    if cranky? || !standing?
      "NO!"
    else
      @action_counts += 1
      return "Twang!!!"
    end
  end

  def run
    if cranky? || !standing?
      "NO!"
    else
      @action_counts += 1
      return "Clop clop clop clop!!!"
    end
  end

  def standing?
    @is_standing
  end

  def sleep
    if standing?
      "NO!"
    else
      @action_counts = 0
      !cranky?
    end
  end

  def lay_down
    @is_standing = false
  end

  def laying?
    !standing?
  end

  def stand_up
    @is_standing = true
  end

  def drink_potion
    if standing?
      @action_counts = 0
      !cranky?
      return "glug glug"
    else !standing?
      @health_levels += 1
      "You shouldn't do that"
    end
  end

  def rested?
    @action_counts == 0
  end

  def sick?
    @health_levels >= 1
  end
end