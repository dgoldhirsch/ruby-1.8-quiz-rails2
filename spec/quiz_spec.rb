require "spec_helper"

class Duck
  attr_accessor :value

  def < other
    value < other.value
  end

  private

  def initialize(value = 0)
    self.value = value
  end
end

describe "Merge Sort Algorithm" do

  it "should work with even number of elements" do
    [5, 2].merge_sort.should == [2, 5]
    [6, 4, 4, 2].merge_sort.should == [2, 4, 4, 6]
  end

  it "should work with odd number of elements" do
    [1].merge_sort.should == [1]
    [5, 2, 1].merge_sort.should == [1, 2, 5]
  end

  it "should work with no elements (empty array)" do
    [].merge_sort.should == []
  end

  it "sorting algorithm should be stable--i.e., should preserve the order of equal elements" do
    b = Duck.new(2)
    bb = Duck.new(2)
    c = Duck.new(4)
    a = Duck.new(1)
    [bb, c, b, a].merge_sort.should == [a, b, bb, c]
  end
end