def ftoc fahrenheit
	temperature = ((fahrenheit - 32) / 1.8)
	if temperature < 0
		return (temperature - 0.5).to_i
	else
		return (temperature + 0.5).to_i
	end
end

def ctof celsius
	temperature = celsius * 1.8 + 32
end