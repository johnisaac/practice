# given arr1 = {5,6,4,2,2} arr2={4,2,2,1} 
# return common elements {4,2,2}


first_array = [5,6,4,2,2]
second_array =[4,2,2,1] 

result_array = []

first_array.each do|first_element|
	second_array.each do|second_element|
		result_array.push( first_element ) and break if first_element == second_element and result_array.index(first_element) == nil
	end
end

puts result_array
