input = gets.chomp
exit(0) if input.length <= 0

input_array = input.split("")

input_array.each_index do|index|
	input_array[index] = "%20" if input_array[index] == " "
end

puts  input_array.join("")