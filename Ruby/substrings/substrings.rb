def substrings(string, dictionary)
	matches = Hash.new(0)
	split_string = string.split(" ")
	dictionary.each do |phrase|
		regex = Regexp.new(phrase, Regexp::IGNORECASE)
		split_string.each do |word|
			if regex.match(word)
				matches[phrase] += 1
			end
		end
	end
	return matches
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)