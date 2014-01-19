totalTime = 0
totalWordCount = 0
totalCharCount = 0
File.open(ARGV[0]).each_line do |line|
	puts line
	t1 = Time.now
	input = STDIN.gets.chomp
	t2 = Time.now

	wordCount = line.count(' ') + 1
	totalWordCount += wordCount
	puts "Word Count: #{wordCount}"

	charCount = line.length
	totalCharCount += charCount
	puts "Character Count: #{charCount}"

	timeTaken = t2 - t1
	totalTime += timeTaken
	puts "Time Taken: #{timeTaken.round(2)}"

	if input == line.strip
		puts "CORRECT"
	else
		puts "WRONG"
	end
	puts "\n"
end
puts "Total Word Count: #{totalWordCount}"
puts "Total Character Count: #{totalCharCount}"
puts "Total Time: #{totalTime.round(2)}"