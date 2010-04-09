require "spec_helper"

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
end