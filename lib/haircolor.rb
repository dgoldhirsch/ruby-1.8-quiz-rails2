class Haircolor
  attr_accessor :string

  # ASSUMPTION:  other object is a Haircolor
  def <=> other
    string <=> other.string
  end

  private

  def initialize(string)
    self.string = string
  end
end