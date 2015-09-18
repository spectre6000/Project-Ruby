def add (num1, num2)
	num1 + num2
end

def subtract(num1, num2)
	num1 - num2
end

def sum (array)
	total = 0
	array.each { |i| total += i }
	total
end

def multiply (*numbers)
	answer = 1
	numbers.each { |i| answer = answer * i }
	answer
end

def power (num1, num2)
	return num1 ** num2
end

def factorial(num)
	output = 1
	if num == 0 || num == 1
		output = 1
	else
		while num > 1
			output = output * num
			num = num - 1
		end
	end
	output
end

