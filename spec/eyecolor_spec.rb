require 'spec_helper'

describe "Eye Color" do
  before(:each) do
    @input = [Eyecolor.blue, Eyecolor.red, Eyecolor.green, Eyecolor.brown, Eyecolor.green, Eyecolor.red, Eyecolor.turquoise]
    @expected = [Eyecolor.red, Eyecolor.red, Eyecolor.blue, Eyecolor.turquoise, Eyecolor.brown, Eyecolor.green, Eyecolor.green]
  end

  it "blue <=> other" do
    after Eyecolor.blue, Eyecolor.red
    same Eyecolor.blue, Eyecolor.blue
    before Eyecolor.blue, Eyecolor.turquoise
    before Eyecolor.blue, Eyecolor.brown
    before Eyecolor.blue, Eyecolor.green
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