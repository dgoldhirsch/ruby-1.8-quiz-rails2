class Array
#  def merge_sort
#    sort
#  end

 def merge_sort
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
end
