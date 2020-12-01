class Vampire
  attr_reader :name,
              :pet,
              :thirsty

  def initialize(name, pet = "bat")
    @name = name
    @pet = pet
    @thirsty = true
    @blood = 0
  end

  def thirsty?
    thirsty
  end

  def drink
    if @blood += 1
      @thirsty =false
    end
  end
end

# require "pry"; binding.pry
