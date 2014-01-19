
def mistakes(original, inputted)
	original = original.split
	inputted = inputted.split
	wrongWordCount = 0
	original.each_with_index do |word,i|
		wrongWordCount += 1 if word == inputted[i]
	end
	percentWordsCorrect = (wrongWordCount/original.length.to_f*100.0).round()
	puts "Words Correct: #{percentWordsCorrect}%"
end

totalTime = 0
totalWordCount = 0
totalCharCount = 0
File.open(ARGV[0]).each_line do |line|
	line = line.strip.gsub(/[.?!]/, '\0|').split('|')
	line.each do |sentence|
		sentence = sentence.strip
		puts sentence
		t1 = Time.now
		input = STDIN.gets.chomp
		mistakes(sentence, input)
		t2 = Time.now

		wordCount = sentence.count(' ') + 1
		totalWordCount += wordCount
		puts "Word Count: #{wordCount}"

		charCount = sentence.length
		totalCharCount += charCount
		puts "Character Count: #{charCount}"

		timeTaken = t2 - t1
		totalTime += timeTaken
		puts "Time Taken: #{timeTaken.round(2)}"

		if input == sentence
			puts "CORRECT"
		elsif input.split == sentence.split
			puts "CORRECT WITH EXTRA SPACE"
		else
			puts "WRONG"
		end
		puts "\n"
	end
end
puts "Total Word Count: #{totalWordCount}"
puts "Total Character Count: #{totalCharCount}"
puts "Total Time: #{totalTime.round(2)}"