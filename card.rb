class Card
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def <=>(other)
    self.name <=> other.name
  end

  def inspect
    "#{name}"
  end

  def to_s
    inspect
  end
end
