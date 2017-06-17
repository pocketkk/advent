require_relative '../main.rb'
require 'pry'

describe Decoder do

	let (:decoder) { Decoder.new }

	it "should load a file" do
	    File.open("tmp", "w") { |f| f.write "TESTtestTEST" }
	    decoder.open("tmp")
	    expect(decoder.input_array[0]).to eq("TESTtestTEST")
	    File.delete("tmp")
	end

	it "decode#decode_index should take an array and index and return the most common character" do
        array = ["123456", "199999", "599999"]
        hash = Hash.new
		expect(decoder.decode_line(array, 0)).to eq("1")
	end

	it "decode#decode should iterate through array and return the passcode" do
	    decoder.open("./test_file")
		expect(decoder.decode).to eq("easter")
	end

end