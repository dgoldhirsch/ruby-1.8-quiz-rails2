require 'spec_helper'

describe "Hair Color Comparator" do
  before(:each) do
    @black = Haircolor.new("black")
    @brown = Haircolor.new("brown")
    @blonde = Haircolor.new("blonde")
    @alsatian = Haircolor.new("alsatian")
    @cyan = Haircolor.new("cyan")
    @input = [@black, @alsatian, @blonde, @cyan, @brown]
    @expected = [@alsatian, @black, @blonde, @brown, @cyan]
  end

  it "should sort alphabetically" do
    @input.sort.should == @expected
  end
end