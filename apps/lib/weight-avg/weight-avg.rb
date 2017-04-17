# Compute the weigted arithmetic mean of two lists of numbers.

class WeightAvg

	def initialize(arr1, arr2)
		if arr1.is_a?(Array) && arr2.is_a?(Array)
			raise ArgumentError, "List must be numeric." unless arr1.all? {|i| i.is_a?(Numeric)}
			raise ArgumentError, "List must be numeric." unless arr2.all? {|i| i.is_a?(Numeric)}
			@arr1, @arr2 = arr1, arr2
		else
			raise ArgumentError, "Arguments must be of type Array."
		end
	end

	def calc
		return ((@arr1.length * firstAvg) + (@arr2.length * secondAvg)) / (@arr1.length + @arr2.length)
	end

	def firstAvg
		return sum(@arr1) / @arr1.length
	end

	def secondAvg
		return sum(@arr2) / @arr2.length
	end

	def sum(arr)
		total = 0
		for i in arr
			total += i
		end
		return total
	end

	private :firstAvg, :secondAvg, :sum

end
