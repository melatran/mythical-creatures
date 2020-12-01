class Hobbit
  attr_reader :name, :disposition, :age
  attr_accessor :name

  def initialize(name, disposition = "homebody")
    @name = name
    @disposition = disposition
    @age = 0
    @has_ring = false
  end

  def celebrate_birthday
    @age += 1
  end

  def adult?
    @age > 18
  end

  def old?
    @age > 100
  end

  def find_ring
    @has_ring = true
  end

  def has_ring?
    @has_ring
  end

  def is_short?
    true
  end
end
