
def is_unique( str )
	str_map = {}
	is_unique = true

	if str.length <= 0 
		puts "string is empty"
		exit(0)
	end

	str.each_char do|char|
		if str_map[char].nil?
			str_map[char] =  1
			is_unique = true
		else
			is_unique = false
			break
		end
	end

	return is_unique
end

puts "Enter a string"
str = gets.chomp

if is_unique(str)
	puts "string has unique characters"
else
	puts "string does not have unique characters"
end

