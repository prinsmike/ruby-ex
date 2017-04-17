#!/usr/bin/ruby

require_relative("../../lib/weight-avg/weight-avg.rb")

trap("INT") {
	puts "The program was interrupted by the user."
	exit
}

def processInput(input)
	outlist = Array.new
	elements = input.split(",")
	for e in elements
		outlist.push(e.to_f)
	end

	outlist
end

list1 = Array.new
list2 = Array.new

puts "Please enter a comma separated list of numeric values for the first list:"
print "[1]>"
while input = gets.chomp

	if list1.length == 0
		list1 = processInput(input)
		puts "Please enter a comma separated list of numeric values for the second list:"
		print "[2]>"
	else
		list2 = processInput(input)
		puts "Weigted Arithmetic Mean: #{WeightAvg.new(list1, list2).calc}"
		exit
	end
end


