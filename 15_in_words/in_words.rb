class Fixnum

	def in_words(current = self)
		places = []
		output = ''

		if current >= 1_000_000_000_000
			trillions = current / 1_000_000_000_000
			current = current - (trillions * 1_000_000_000_000)
			output += in_words(trillions).to_s + " trillion"
			if current > 0
				output += ' '
			end
		end

		if current >= 1_000_000_000
			billions = current / 1_000_000_000
			current = current - (billions * 1_000_000_000)
			output += in_words(billions).to_s + " billion"
			if current > 0
				output += ' '
			end
		end

		if current >= 1_000_000
			millions = current / 1_000_000
			current = current - (millions * 1_000_000)
			output += in_words(millions).to_s + " million"
			if current > 0
				output += ' '
			end
		end

		if current >= 1_000
			thousands = current / 1_000
			current = current - (thousands * 1_000)
			output += in_words(thousands).to_s + " thousand"
			if current > 0
				output += ' '
			end
		end

		if current >= 100
			hundreds = current / 100
			current = current - (hundreds * 100)
			output += in_words(hundreds).to_s + " hundred"
			if current > 0
				output += ' '
			end
		end

		if current >= 20
			tens = current / 10
			current = current - (tens * 10)
			ten_words = {2 => 'twenty', 3 => 'thirty', 4 => 'forty', 5 => 'fifty', 6 => 'sixty', 7 => 'seventy', 8 => 'eighty', 9 => 'ninety'}
			output += ten_words[tens].to_s
			if current > 0
				output += ' ' + in_words(current).to_s
			end
		elsif current >= 10 && current < 20
			tens = current / 10
			current = current - (tens * 10)
			ten_words = {10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'}
			if tens > 1
				output += ten_words[tens]
			elsif tens == 1
				output += ten_words[(tens * 10 ) + current].to_s
			end
		elsif current < 10 && current > 0
			ones = {1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine'}
			output += ones[current].to_s
			# current = current - current
		elsif current == 0 && current == self
			output += 'zero'
		end
		output
	end
end

# puts 10047.in_words