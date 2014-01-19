x = "Type this sentence"
puts x
t1 = Time.now
a = gets.chomp
t2 = Time.now
puts t2 - t1
puts "TRUE" if a == x