def caesar_cipher(string, shift_factor)
	if shift_factor > 26
		shift_factor = shift_factor % 26
	end
	split_string = string.split("")
	split_string.map! do |char|
		char = shift(char, shift_factor)
	end	
	return split_string.join("")
end

def shift(char, shift_factor)
	if char.match(/[a-z]/)
			if (char.ord + shift_factor) > 122
				adjusted_shift_factor = (char.ord + shift_factor) - 122
				return (96 + adjusted_shift_factor).chr
			else
				return (char.ord + shift_factor).chr
			end
	elsif char.match(/[A-Z]/)
			if (char.ord + shift_factor) > 90
				adjusted_shift_factor = (char.ord + shift_factor) - 90
				return (64 + adjusted_shift_factor).chr
			else
				return (char.ord + shift_factor).chr
			end
	else
		return char		
	end
end

puts "Enter a string to convert to Caeser's cypher:"
string = gets.chomp
puts "Enter the shift value:"
shift_factor = gets.chomp.to_i
puts caesar_cipher(string, shift_factor)