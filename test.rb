require 'colorize'


###### SPIKE FUNCTIONS ############

def printStuff(x) 

	puts x

end

def evaluateSurvival(array)

	# SPIKE : check column size
	# array.each_with_index do |data_row, index_row| 
	# 	puts "column size - row : " + 
	# 		 index_row.to_s + 
	# 		 " : " + 
	# 		 data_row.length().to_s

	# end

	# Condition 1
	# Any live cell with fewer than two live neighbours dies, 
	# as if caused by underpopulation.

	current_row = 5
	current_column = 3

	# check row, column without thinking about boundaries
	# think of it as a 3x3 grid with the current_row and 
	# current_column is the center of the grid. 
	# Count everything except the center. 
	# evaluate the count, if meet condition
	# Execute condition

	first_cell_row = current_row - 1
	last_cell_row = current_row + 1
	# first_cell_column = current column - 1
	# last_cell_column = current column + 1

	puts array[0][0].to_s



	# check row, column including boudaries


end


##################################

# size = 20
width = 20
height = 10

array = Array.new(height) {Array.new(width,"-")}

# while 1 do 
	system "clear"
	# random seed
	array.each_with_index{ 
		|data_x, index_x| data_x.each_with_index{ 
			|data_y,index_y| 
			seed = rand(2)
			seed == 1 ? array[index_x][index_y] = "-" : array[index_x][index_y] = "0".red

			print array[index_x][index_y].to_s

		}
			print "\n"
	}

	evaluateSurvival(array)

	sleep(0.5)
# end




# array.each_with_index{ |i, index| puts "index: " + index.to_s + ", value: " + i.to_s}
# array[1][1] = 999
# puts "array[1,0] = " + array[0][1].to_s
# puts "\n"
# puts "array[1,1] = " + array[1][1].to_s