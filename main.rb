#!/usr/bin/env ruby

class Decoder

	attr_accessor :input_array

	def initialize
		self.input_array = []
	end

	def open(file_n)
		File.open(file_n, "r") { |file| file.each_line { |line| input_array.push(line.strip)}}
	end

	def decode_line(arr, index)
		hash = Hash.new(0)
		arr.each { |el| hash[el[index]] += 1}
		hash.max_by{|k,v| v}[0]
	end

	def decode
		result = ""
		num = 0

		begin
		   result += decode_line(input_array, num)
		   num +=1
		end while num < input_array[0].length

		result
	end

end

# # Uncomment lines below and enter 'ruby ./main.rb advent_file' in the command prompt
# d = Decoder.new
# d.open(ARGV[0])
# puts d.decode

