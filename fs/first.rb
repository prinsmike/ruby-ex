#!/usr/bin/ruby

array_length = ARGV[0].to_i

if array_length < 1
	puts "You must provide a length for the data array."
	exit
end

data = Array.new(array_length) { |e| e = rand(100) }

puts "Data:"
puts "#{data}"

if File.file?("data.txt")
	puts "Found an old data file:"
	lines = IO.readlines("data.txt")
	
	old_data = Array.new()

	lines.each do |i|
		old_data.push(i.chomp.to_i)
	end

	puts "#{old_data}"

	# This is redundant since any existing file will be overwritten later.
	File.delete("data.txt")
end

s = ""

for i in data
	s = s + i.to_s + "\n"
end

f = File.open("data.txt", "w")
if f
	f.syswrite(s)
else
	puts "Could not open file for writing!"
end
