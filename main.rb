
def mistakes(original, inputted)
	original = original.split
	inputted = inputted.split
	correctWordCount = 0
	original.each_with_index do |word,i|
		correctWordCount += 1 if word == inputted[i]
	end
	percentWordsCorrect = (correctWordCount/original.length.to_f*100.0).round()
	return correctWordCount, percentWordsCorrect
end

totalTime = 0
totalWordsCorrect = 0
totalWordCount = 0
totalCharCount = 0

points = 0
File.new('scores.txt','r').each_line do |line|
	points = line.to_i
end

File.open(ARGV[0]).each_line do |line|
	line = line.strip.gsub(/[.?!]/, '\0|').split('|')
	line.each do |sentence|
		sentence = sentence.strip
		puts sentence
		t1 = Time.now
		input = STDIN.gets.chomp
		correctWordCount, percentWordsCorrect = mistakes(sentence, input)
		t2 = Time.now

		wordCount = sentence.count(' ') + 1
		totalWordCount += wordCount
		totalWordsCorrect += correctWordCount
		puts "Words Correct: #{correctWordCount}/#{wordCount} words"
		puts "Words Correct: #{percentWordsCorrect}%"

		charCount = sentence.length
		totalCharCount += charCount
		puts "Character Count: #{charCount}"

		timeTaken = t2 - t1
		totalTime += timeTaken
		puts "Time Taken: #{timeTaken.round(2)}"

		output = File.new('output.txt','a')		

		if input == sentence
			puts "CORRECT"
		elsif input.split == sentence.split
			puts "CORRECT WITH EXTRA SPACE"
			output.puts(sentence)
			output.puts(input)
		elsif input.gsub(/\s+/,'') == sentence.gsub(/\s+/,'')
			puts "CORRECT WITH MISSING SPACE"
			output.puts(sentence)
			output.puts(input)
		else
			puts "WRONG"
			output.puts(sentence)
			output.puts(input)
		end
		output.close
		puts "\n"
	end
end

points += totalWordsCorrect
File.new('scores.txt','w') << points

puts "Total Words Correct: #{totalWordsCorrect}/#{totalWordCount}"
puts "Total Character Count: #{totalCharCount}"
puts "Total Time: #{totalTime.round(2)}"
puts "Total Points: #{points}"