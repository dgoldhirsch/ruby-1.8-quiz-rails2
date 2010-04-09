class Array

  # Here's the algorithm as given on the quiz,
  # with its two infinite loops.
  def bad_merge_sort
    return self if size < 1                   # Note B

    list1 = self[0..(size/2)].merge_sort      # Note A
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
    return result + list1 + list2            # Note that list1 xor list2 will have at most a single element
  end

  # This fixes the critical problems of bad_merge_sort without additional refactoring.
  def fixed_merge_sort
    return self if size <= 1                  # Fix for B

    left = self[0, size/2]                    # Fix...
    right = self[size/2, size - size/2]       # for A
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

  # Here's a version that is perhaps more idiomatic for Ruby and which may run faster
  # (because it tries to optimize the rejoining of the sublists).
  def merge_sort
    return self if size <= 1
    pieces = split_for_merge_sort # => [left half, right half which may be one item larger]
    left = pieces[0].merge_sort
    right = pieces[1].merge_sort
    result = left.join_for_merge_sort(right)
  end

  protected
  
  # Break up an array into two "equal" halves.
  # If odd number of elements, second "half" has one more than first "half".
  # Examples:
  # [].split => []
  # [1] => [[], [1]]
  # [1, 2] => [[1], [2]]
  def split_for_merge_sort
    [self[0, size/2], self[size/2, size - size/2]]
  end

  # Merge two ordered sublists, e.g.:
  # merge [1, 3], [2, 4] => [1, 2, 3, 4]
  # ASSUMPTION:  right is not empty (self might be, however)
  def join_for_merge_sort(right)
    return self + right if last <= right.first # I.e., all in left must be <= anything in right.
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
