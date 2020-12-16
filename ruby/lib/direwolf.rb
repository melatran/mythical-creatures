class Direwolf
  attr_reader :name, :home, :size, :starks_to_protect

  def initialize(name, home = "Beyond the Wall", size = "Massive")
    @name = name
    @home = home
    @size = size
    @starks_to_protect = []
  end

  def protects(stark)
    if stark.location == @home && @starks_to_protect.length < 2
      @starks_to_protect << stark
      stark.protected_by_direwolf
    else
      "Direwolf is fully occupied"
    end
  end

  def hunts_white_walkers?
    @starks_to_protect.length == 0
  end

  def leaves(stark)
    @starks_to_protect.delete(stark)
    stark.unprotected
    return stark
  end
end



class Stark
  attr_reader :name, :location, :house_words

  def initialize(name, location = "Winterfell", house_words = "Winter is Coming")
    @name = name
    @location = location
    @safe = false
    @house_words = house_words
  end

  def safe?
    @safe
  end
  
  def unprotected
    @safe = false
  end

  def protected_by_direwolf
    @safe = true
    @house_words = "The North Remembers"
  end
end