class Book
	attr_reader :title	
	
	def title=(name)
		words = name.split(" ")
		exceptions = ["a","an","the","of","or","and","to","in"]
		output = words.shift.capitalize
		words.each do |word|
			if exceptions.include?(word.to_s.downcase)
				output << " " + word
			else
				output << " " + word.capitalize
			end
		end
		@title = output
	end

end


@book = Book.new

@book.title = "name of book"

puts @book.title

