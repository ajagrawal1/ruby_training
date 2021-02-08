require "csv"

class ArrayMethodCollection

    def check_value
        array = input_array
        
        puts "The available array is #{array}"
        puts "Please insert the number you want to check :"
        num = gets.chomp.to_i

        if array.include? num
            puts "The number : #{num} is utsresent in the available array"
        else
            puts "The number : #{num} is not present in the available array"
        end
    end

    def join
        array1 = input_array
        array2 = input_array

        puts "The available arrays are: \n#{array1} \n#{array2}"
        array2.each{ |element| array1.push(element) }
        puts "The resultant array after joining is: \n#{array1}"
    end

    def double
        array = input_array

        puts "The available array is: \n#{array}"
        array.map!{ |element| element * 2 }
        puts "The required array with double values is : \n#{array}"
    end

    def double_ignore_string
        array = input_array

        puts "The available array is: \n#{array}"
        array.map!{ |element| (element.is_a? Integer) ? element * 2 : element }
        puts "The required array with double values is : \n#{array}"
    end

    def frequency_counter
        array = input_array

        puts "The available array is: \n#{array}"
        frequency= Hash.new(0)
        array.each{ |element| frequency[element] += 1 }
        puts "The frequency of elements in the given array is :\n#{frequency}"
    end

    private

    def input_array
        puts "Please enter the array elements separated by (,) without spacing and other than 0"
        input = gets.chomp.split(',')
        input.map! { |element| element.to_i != 0 ? element.to_i : element }
    end

end

class CsvMethodCollection

    def self.multiply_column
        csv =  CSV.open('test.csv', 'wb')
        puts "Enter the no. of rows: "
        number_of_rows = gets.chomp.to_i

        for row_num in 0...number_of_rows
            row = []
            puts "Enter the first element of row #{row_num + 1} "
            row[0] = gets.chomp.to_i
            puts "Enter the second element of row #{row_num + 1} "
            row[1] = gets.chomp.to_i
            row[2] = row[0] * row[1]
            csv << row
        end

        csv.close
        puts "Successfully added the rows to the csv file."
    end

end

class MatrixMethodCollection

    def transpose
        matrix = input_matrix
        puts "Given Matrix is :"
        display_matrix matrix

        for row_num in 0...@dimension
            for col_num in row_num...@dimension
                temp = matrix[row_num][col_num]
                matrix[row_num][col_num] = matrix[col_num][row_num]
                matrix[col_num][row_num] = temp
            end
        end

        puts "Your required transpose matrix is :\n"
        display_matrix matrix
    end

    private

    def input_matrix
        puts "Enter the no. of rows of matrix : "
        @dimension = gets.chomp.to_i
        
        matrix = Array.new
        for row_num in 0...@dimension
            row = []
            for col_num in 0...@dimension
                puts "Enter the value of col: #{col_num + 1} of row: #{row_num + 1 }"
                row[col_num] = gets.chomp.to_i
            end
            matrix.push(row)
        end
        matrix
    end

    def display_matrix matrix
        matrix.each { |row| p row}
    end 

end

class Assignment
    
    @option = 0
    
    def initialize
        @array_methods = ArrayMethodCollection.new
        puts "Welcome to the Day_1 Task of Ruby Training"
        start
        puts "Thanks for Playing"
    end

    def print_elements
        (1..100).each{ |num| p num }
    end

    def start
        display_Option

        print_elements if @option == 1
        @array_methods.check_value if @option == 2
        @array_methods.join if @option == 3
        @array_methods.double if @option == 4
        @array_methods.double_ignore_string if @option == 5
        @array_methods.frequency_counter if @option == 6
        CsvMethodCollection.multiply_column if @option == 7
        MatrixMethodCollection.new.transpose if @option == 8
        return if @option == 9

        want_to_play
    end

    private

    def display_Option
        puts "Please select your Option"
        puts "1. To print Nos. from 1 to 100"
        puts "2. Check if value is present in an array"
        puts "3. To Merge two array"
        puts "4. To Double the value of elements of array"
        puts "5. To Double the value of elements of array excluding String"
        puts "6. To Calculate the frequency in a Hash"
        puts "7. To multiply the first two column of a csv file"
        puts "8. To get Transpose of a Matrix"
        puts "9. Exit"
        @option = gets.chomp.to_i
    end

    def want_to_play
        p "Want to Play Again (Y/N):"
        choice = gets.chomp
        if choice == "Y" || choice == 'y'
            return start
        end
    end

end

Assignment.new