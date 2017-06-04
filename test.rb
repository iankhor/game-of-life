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

	current_row = 5 # array index 4
	current_column = 3 # array index 2

	# check row, column without thinking about boundaries
	# think of it as a 3x3 grid with the current_row and 
	# current_column is the center of the grid. 
	# Count everything except the center. 
	# evaluate the count, if meet condition
	# Execute condition

	first_cell_row = current_row - 1
	last_cell_row = current_row + 1
	first_cell_column = current_column - 1
	last_cell_column = current_column + 1
	count = 0

	puts ""
	puts "=" * 10
	puts "evaluation grid"
	puts ""


	evaluation_grid_row = array[first_cell_row..last_cell_row]

	# isolate rows
	evaluation_grid_row.each_with_index do |data_row, index_row|
		evaluation_grid_column = data_row[first_cell_column..last_cell_column]

		# isolate columns
		evaluation_grid_column.each_with_index do |data_column, index_column|

			evaluation_grid_row[index_row][index_column] == "0".red ? count+=1 : count+=0

			print evaluation_grid_row[index_row][index_column].to_s	
		end
			puts ""

	end

	puts "Live cells : " + count.to_s
	puts ""
	puts "=" * 10

	# check row, column including boudaries



end


##################################

# size = 20
width = 20
height = 10

array = Array.new(height) {Array.new(width,"-")}

while 1 do 
	system "clear"
	puts "#" * 10
	puts "life grid seed"
	puts ""
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

	puts ""
	puts "#" * 10


	evaluateSurvival(array)

	sleep(0.5)
end




# array.each_with_index{ |i, index| puts "index: " + index.to_s + ", value: " + i.to_s}
# array[1][1] = 999
# puts "array[1,0] = " + array[0][1].to_s
# puts "\n"
# puts "array[1,1] = " + array[1][1].to_s