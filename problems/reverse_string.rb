puts "Enter a string"
str = gets.chomp
i = 0

if str.length > 0 
	puts "string is empty"
	exit(0)
end

str_array = str.split()

if str_array%2 == 0
	while(i<str_array.length/2)
		str_array[i]
	end

else
end
