def translate(phrase)
	words = phrase.split

	words.map! do |x|
		translate_word(x)
	end

	words.join(' ')
end

def translate_word(word)
	if initial_vowel?(word)
		return word + "ay"
	else
		consonants = word.slice(0, qty_initial_consonants(word))
		return word.slice((qty_initial_consonants(word)), word.length) + consonants + "ay"
	end
end

def initial_vowel?(word)
	vowels = ["a", "e", "i", "o", "u"]
	return true if vowels.include? word.slice(0,1).downcase
	false
end

def qty_initial_consonants(word)
	letters = word.split(//)
	count = 0
	previous = ''
	letters.each do |x|
		if previous == 'q' && x.downcase == 'u'
			count += 1
			previous = x.downcase
		elsif !initial_vowel? x
			count += 1
			previous = x.downcase
		else
			break # break letters.each on first vowel
		end
	end
	count
end