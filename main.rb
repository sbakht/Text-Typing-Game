totalTime = 0
File.open(ARGV[0]).each_line do |line|
	puts line
	t1 = Time.now
	input = STDIN.gets.chomp
	t2 = Time.now

	timeTaken = t2 - t1
	totalTime += timeTaken
	puts "Time Taken: #{timeTaken}"
	if input == line.strip
		puts "CORRECT"
	else
		puts "WRONG"
	end
end
puts "Total Time: #{totalTime}"