
require_relative("weight-avg.rb")
require "test/unit"

class TestWeightedAvg < Test::Unit::TestCase

	def testInt
		list1 = Array[62, 67, 71, 74, 76, 77, 78, 79, 79, 80, 80, 81, 81, 82, 83, 84, 86, 89, 93, 98]
		list2 = Array[81, 82, 83, 84, 85, 86, 87, 87, 88, 88, 89, 89, 89, 90, 90, 90, 90, 91, 91, 91, 92, 92, 93, 93, 94, 95, 96, 97, 98, 99]

		assert_equal(86, WeightAvg.new(list1, list2).calc)
	end

	def testFloat
		floatList1 = Array[0.62, 0.67, 0.71, 0.74, 0.76, 0.77, 0.78, 0.79, 0.79, 0.80, 0.80, 0.81, 0.81, 0.82, 0.83, 0.84, 0.86, 0.89, 0.93, 0.98]
		floatList2 = Array[0.81, 0.82, 0.83, 0.84, 0.85, 0.86, 0.87, 0.87, 0.88, 0.88, 0.89, 0.89, 0.89, 0.90, 0.90, 0.90, 0.90, 0.91, 0.91, 0.91, 0.92, 0.92, 0.93, 0.93, 0.94, 0.95, 0.96, 0.97, 0.98, 0.99]
		assert_equal(0.86, WeightAvg.new(floatList1, floatList2).calc)
	end

	def testArgErr
		failList1 = Array[62, 67, 71, 74, 76, 77, 78, 79, "five", 80, 80, 81, 81, 82, 83, 84, 86, 89, 93, 98]
		failList2 = Array[81, 82, 83, 84, 85, 86, 87, 87, 88, 88, 89, 89, 89, 90, 90, 90, 90, 91, "9", 91, 92, 92, 93, 93, 94, 95, 96, 97, 98, 99]
		assert_raise(ArgumentError) { WeightAvg.new(failList1, failList2) }
	end

end
