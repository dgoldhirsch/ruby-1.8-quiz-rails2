require 'spec_helper'

  @@order = [Red.instance, Blue.instance, Turquoise.instance, Brown.instance, Green.instance]

describe "Eye Color" do
  before(:each) do
    @input = [Eyecolor.blue, Eyecolor.red, Eyecolor.green, Eyecolor.brown, Eyecolor.green, Eyecolor.red, Eyecolor.turquoise]
    @expected = [Eyecolor.red, Eyecolor.red, Eyecolor.blue, Eyecolor.turquoise, Eyecolor.brown, Eyecolor.green, Eyecolor.green]
  end

  it "red <=>" do
    same Eyecolor.red, Eyecolor.red
    before Eyecolor.red, Eyecolor.red
    before Eyecolor.red, Eyecolor.blue
    before Eyecolor.red, Eyecolor.turquoise
    before Eyecolor.red, Eyecolor.brown
    before Eyecolor.red, Eyecolor.green
  end

  it "blue <=> other" do
    after Eyecolor.blue, Eyecolor.red
    same Eyecolor.blue, Eyecolor.blue
    before Eyecolor.blue, Eyecolor.turquoise
    before Eyecolor.blue, Eyecolor.brown
    before Eyecolor.blue, Eyecolor.green
  end

  it "turquoise <=> other" do
    after Eyecolor.turquoise, Eyecolor.red
    after Eyecolor.turquoise, Eyecolor.blue
    same Eyecolor.turquoise, Eyecolor.turquoise
    before Eyecolor.turquoise, Eyecolor.brown
    before Eyecolor.turquoise, Eyecolor.green
  end

  it "brown <=> other" do
    after Eyecolor.brown, Eyecolor.red
    after Eyecolor.brown, Eyecolor.blue
    after Eyecolor.brown, Eyecolor.turquoise
    same Eyecolor.brown, Eyecolor.brown
    before Eyecolor.brown, Eyecolor.green
  end

  it "green <=> other" do
    after Eyecolor.green, Eyecolor.red
    after Eyecolor.green, Eyecolor.blue
    after Eyecolor.green, Eyecolor.turquoise
    after Eyecolor.green, Eyecolor.brown
    same Eyecolor.green, Eyecolor.green
  end

  # Not really necessary once we've verified <=>, but what the heck...
  it "should sort alphabetically" do
    @input.sort.should == @expected
  end

  private

  def same color, another
    (color <=> another).should == 0
    color.should == another
    color.should === another
    color.should be_equal another
  end

  def not_same color, another
    color.should_not == another
    color.should_not === another
    color.should_not be_equal another
  end

  def before color, another
    (color <=> another).should be < 0
    not_same color, another
  end

  def after color, another
    (color <=> another).should be > 0
    not_same color, another
  end
end