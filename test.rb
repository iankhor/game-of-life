size = 20

array = Array.new(size,"-") {Array.new(size,"-")}

# random seed
array.each_with_index{ 
	|data_x, index_x| data_x.each_with_index{ 
		|data_y,index_y| 
		seed = rand(2)
		seed == 1 ? data_y = "-" : data_y = "x"
		# print index_x.to_s + "," + index_y.to_s + " : " + data_y.to_s
		print data_y.to_s

	}
		print "\n"
}



# array.each_with_index{ |i, index| puts "index: " + index.to_s + ", value: " + i.to_s}
# array[1][1] = 999
# puts "array[1,0] = " + array[0][1].to_s
# puts "\n"
# puts "array[1,1] = " + array[1][1].to_s