require 'colorize'


###### SPIKE FUNCTIONS ############

def printStuff(x) 

	puts x

end

def evaluateSurvival(array, current_row, current_column)

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

	# current_row = 5 # array index 4
	# current_column = 3 # array index 2

	# check row, column without thinking about boundaries
	# think of it as a 3x3 grid with the current_row and 
	# current_column is the center of the grid. 
	# Count everything except the center. 
	# evaluate the count, if meet condition
	# Execute condition

	current_cell 		= array[current_row - 1][current_column - 1]
	first_cell_row 		= ( current_row - 1) - 1
	last_cell_row 		= ( current_row - 1) + 1
	first_cell_column 	= ( current_column - 1) - 1
	last_cell_column 	= ( current_column - 1) + 1
	live_cell_count 	= 0
	isLive_print 		= false.to_s.red
	isLive 				= false

	live_condition = 5

	puts ""
	puts "=" * 10
	puts "Evaluated grid at coordinates" + "( " + current_row.to_s + ", " + current_column.to_s + " )"
	puts ""


	evaluation_grid_row = array[first_cell_row..last_cell_row]

	# isolate rows
	array.each_with_index do |data_row, index_row|

		if index_row <= last_cell_row and index_row >= first_cell_row then

			data_row.each_with_index do |data_column, index_column|
				if index_column <= last_cell_column and index_column >= first_cell_column then
					data_column == "0".red ? live_cell_count+=1 : live_cell_count+=0
					# puts "index_row : " + index_row.to_s + ", index_column : " + index_column.to_s 
					print data_column.to_s
				end

			end
				puts ""

		end

	end



	# adjust live_cell_count if current cell is live
	array[current_row - 1][current_column - 1] == "0".red ? live_cell_count-=1 : ""


	# execute condition
	live_cell_count < live_condition ? isLive_print = false.to_s.red : isLive_print = true.to_s.green

	live_cell_count < live_condition ? isLive = false : isLive = true

	
	if isLive then
		# do nothig
	else
		# kill cell
		if current_cell == "0".red then
			array[current_row - 1][current_column - 1] = "X".green
		end
	end

	puts ""
	puts "Neighbouring Live cells : " + live_cell_count.to_s
	puts "Live condition : <" + live_condition.to_s
	puts "Cell to live ? " + isLive.to_s
	puts ""
	puts "=" * 10

	# check row, column including boudaries

	# return array
	return array


end

def seedGrid(width, height)

	array = Array.new(height) {Array.new(width,"-")}

	# random seed
	array.each_with_index{ 
		|data_x, index_x| data_x.each_with_index{ 
			|data_y,index_y| 
			seed = rand(2)
			seed == 1 ? array[index_x][index_y] = "-" : array[index_x][index_y] = "0".red

			# print array[index_x][index_y].to_s

		}
			# print "\n"
	}

	return array

end

def printCellGrid(cells, message)

	puts "#" * 10
	puts message
	puts ""
	cells.each_with_index{ 
		|data_x, index_x| data_x.each_with_index{ 
			|data_y,index_y| 

			print cells[index_x][index_y].to_s

		}
			print "\n"
	}
	puts ""
	puts "#" * 10

end


##################################

# size = 20
# width = 20
# height = 10

# array = Array.new(height) {Array.new(width,"-")}

while 1 do 

	system "clear"
	cells = seedGrid( 20 , 10 )
	printCellGrid(cells, "initial seed")


	# evaluate cells 
	cells = evaluateSurvival(cells,5,3)

	# # print evaluated array 
	printCellGrid(cells, "Evaluated cells")

	puts ""
	puts "#" * 10


	# evaluateSurvival(cells)

	sleep(1)
end




# array.each_with_index{ |i, index| puts "index: " + index.to_s + ", value: " + i.to_s}
# array[1][1] = 999
# puts "array[1,0] = " + array[0][1].to_s
# puts "\n"
# puts "array[1,1] = " + array[1][1].to_s