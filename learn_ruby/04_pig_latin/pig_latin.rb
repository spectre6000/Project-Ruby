def translate (string)
	sentence = string.split(" ")
	#deconstruct
	punctuation_holder = punctuation(sentence)[0]
	sentence = punctuation(sentence)[1]
	caps = pull_caps(sentence)
	#reconstruct
	sentence = convert_words(sentence)
	sentence = cap_words(sentence, caps)
	sentence = replace_punctuation(sentence, punctuation_holder)
	#finish
	sentence.join(" ")
end

def convert_words (sentence)
	sentence_holder = []
	#local variables for converting individual words
	sentence.each do |word|
		exceptions = ["a","e","i","o","u"]
		letters = word.split("")
		start = []
		trigger = false
		balance = []
		#This is the part that converts a single word to piglatin
		letters.each do |i|
			if trigger == false
				if !exceptions.include?(i.downcase)
					if i.downcase + letters[letters.index(i)+1] == "q" + "u"
						start << i.downcase + letters[letters.index(i)+1]
						letters.delete_at(letters.index(i)+1)
					else
						start << i.downcase
					end
				else
					balance << i
					trigger = true
				end
			else
				balance << i
			end
		end
		sentence_holder << balance.join("") + start.join("") + "ay"
	end
	sentence_holder
end
	
def	pull_caps (sentence)
	cap_holder = []
	#figures out which words need to be capped
	sentence.each do |word|
		if word == word.capitalize
			cap_holder << sentence.index(word)
		end
	end
	cap_holder
end

def cap_words(sentence, caps)
	caps.each do |x|
		sentence[x] = sentence[x].capitalize
	end
	sentence 
end

def punctuation (sentence)
	punctuation = ['"', "'", ",", ".", "?", ";", ":", "<", ">", "&", "!", "(", ")"]
	punctuation_holder = []
	sentence_holder = []
	sentence.each do |word|
		letters = word.split("")
		letters.each do |i|
			#pull punctuation
			#apostrophe-s
			if punctuation.include?(i) && letters[letters.index(i) + 1] == "s"
				punctuation_holder << ["#{i}#{letters[letters.index(i)+1]}", letters.index(i), sentence.index(word)]
				letters.delete_at(letters.index(i) + 1)
				letters.delete_at(letters.index(i))
			#in case there are two punctuations in a row
			elsif punctuation.include?(i) && punctuation.include?(letters[letters.index(i) + 1])
				punctuation_holder << ["#{i}#{letters[letters.index(i)+1]}", letters.index(i), sentence.index(word)]
				letters.delete_at(letters.index(i) + 1)
				letters.delete_at(letters.index(i))
			#everything else
			elsif punctuation.include?(i) 
				punctuation_holder << [i, letters.index(i), sentence.index(word)]
				letters.delete_at(letters.index(i))
			end
		end
		word = letters.join("")
		sentence_holder << word
	end
	return punctuation_holder, sentence_holder
end

def replace_punctuation(sentence, punctuation_holder)
	#replaces punctuation
	punctuation_holder.each do |p|
		#ternary; puts punctuation at end of word unless it's at the beginning
		p[1] == 0 ? insert_punctuation(sentence, p[2], p[1], p[0]) : insert_punctuation(sentence, p[2], -1, p[0])
	end
	sentence
end

	def insert_punctuation(sentence, pos1, pos2, pos3)
		sentence[pos1].insert(pos2, pos3)
	end

