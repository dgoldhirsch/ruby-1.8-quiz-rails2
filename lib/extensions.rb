class Array

  # Here's the algorithm as given on the quiz,
  # with its two infinite loop bugs.
  def bad_merge_sort
    return self if size < 1

    list1 = self[0..(size/2)].merge_sort
    list2 = self[(size/2)+1..-1].merge_sort
    result = []
    until list1.empty? || list2.empty? do
      if list1.first < list2.first
        result << list1.first
        list1 = list1[1..-1]
      else
        result << list2.first
        list2 = list2[1..-1]
      end
    end
    return result + list1 + list2
  end

  # This is a fixed version of the given algorithm.
  # It works although it may not be the easiest to read and does some unnecessary merging
  # (sublists are merged even if the left sublist is obviously "before" the right sublist).
  def fixed_merge_sort
    return self if size <= 1

    left = self[0, size/2]
    right = self[size/2, size - size/2]
    list1 = left.merge_sort
    list2 = right.merge_sort
    result = []
    until list1.empty? || list2.empty? do
      if list1.first < list2.first
        result << list1.first
        list1 = list1[1..-1]
      else
        result << list2.first
        list2 = list2[1..-1]
      end
    end
    return result + list1 + list2
  end

  # Here's a version that is perhaps easier to read (depends on who's reading it :-)).
  def merge_sort
    return self if size <= 1
    left = self[0, size/2].merge_sort
    right = self[size/2, size - size/2].merge_sort # This will be the larger "half" if self.size is odd
    result = left.join_to(right)
  end

# Now, a couple of subroutines.  It is usually better to have small methods that each
# do something very simple.  This makes them easy to document and to test.
#
# Break up an array into two "equal" halves (if odd number of elements,
# the second "half" gets the extra element).  Examples:
# [].split => []
# [1] => [[], [1]]
# [1, 2] => [[1], [2]]
  def split
    [[0, size/2], [size/2, size - size/2]]
  end

# Merge two ordered sublists, e.g.:
# merge [1, 3], [2, 4] => [1, 2, 3, 4]
# Note microscopic optimization:  if left.last <= right.first, simply return left + right since
# everything in left is already guaranteed in order and "before" everything in right.
  def join_to(right)
    return self if right.empty?
    return right if empty?
    return self + right if last <= right.first
    complicated_join_to(right)
  end

  def complicated_join_to(right)
    result = []
    until empty? || right.empty? do
      if first <= right.first
        result << shift # Easier to read and harmless in this little test, but see "Shifty" article, http://bobhutchison.wordpress.com/2006/09/23/rubys-arrayshift-is-shifty/
      else
        result << right.shift
      end
    end
    result + self + right
  end
end
