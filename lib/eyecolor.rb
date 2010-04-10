require 'singleton'

class Eyecolor
  include Singleton
  
  def self.red
    Red.instance
  end

  def self.blue
    Blue.instance
  end

  def self.green
    Green.instance
  end

  def self.brown
    Brown.instance
  end

  def self.turquoise
    Turquoise.instance
  end

  def to_s
    self.class.name
  end

  private_class_method :new  # Make sure no one instantiates an Eyecolor object
end

class Red < Eyecolor; end
class Blue < Eyecolor; end
class Green  < Eyecolor; end
class Brown < Eyecolor; end
class Turquoise < Eyecolor; end

class Eyecolor
  @@order = [Red.instance, Blue.instance, Turquoise.instance, Brown.instance, Green.instance]

  def <=> other
    position <=> other.position
  end

  protected
  
  # Return index within @@order.  E.g.:  @@red.position => 0, @@blue.position => 1, @@turquoise.position => 2
  def position
    @@order.find_index(self)
  end
end