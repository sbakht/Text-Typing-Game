File.open(ARGV[0]).each_line do |line|
	puts line
	t1 = Time.now
	a = STDIN.gets.chomp
	t2 = Time.now
	puts t2 - t1
	if a == line.strip
		puts "CORRECT"
	else
		puts "WRONG"
	end
end