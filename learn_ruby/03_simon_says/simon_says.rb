def echo(string)
	"#{string}"
end

def shout(string)
	"#{string.upcase}"
end

def repeat(string, number=2)
	output = []
	number.times do |i|
		output << string
	end
	output.join(" ")
end

def start_of_word(string, number)
	string = string.split("")
	gather = []
	while number > 0
		gather << string.shift
		number = number -1
	end
	gather.join
end

def first_word(string)
	string.split(" ").shift
end

def titleize(string)
	exceptions = ["a", "the", "of", "an", "for", "to", "and"]
	#split string into array
	hold = string.split
	#calculate array length for capping zeroeth word
	length = hold.length
	#cap zeroeth word
	hold[0] = hold[0].capitalize
	#temp output placeholder
	output = []	
	#cap all non-exceptions
	hold.each do |i|
		if 	exceptions.include?(i)
			output << i
		else
			output << i.capitalize
		end
	end
	#put array back to string	
	output.join(' ')
end

puts titleize("the bridge over the river kwai")