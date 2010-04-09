require 'spec_helper'

describe "Eye Color Comparator" do
  before(:each) do
    @input = [Eyecolor.blue, Eyecolor.red, Eyecolor.green, Eyecolor.brown, Eyecolor.green, Eyecolor.red, Eyecolor.turquoise]
    @expected = [Eyecolor.red, Eyecolor.red, Eyecolor.blue, Eyecolor.turquoise, Eyecolor.brown, Eyecolor.green, Eyecolor.green]
  end

  it "should sort alphabetically" do
    @input.sort.should == @expected
  end
end