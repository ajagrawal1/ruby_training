class Task
    
    def task1
        (1..100).each{ |num| p num }
    end

    def task2
        array = input_array
        print "The available array is #{array} \nPlease insert the number you want to check : "
        num = gets.chomp.to_i
        if array.include? num
            p "The number : #{num} is present in the available array"
        else
            p "The number : #{num} is not present in the available array"
        end
    end

    def task3
        array1 = input_array
        array2 = input_array
        puts "The available arrays are: \n#{array1} \n#{array2}"
        array2.each{ |element| array1.push(element) }
        puts "The resultant array after joining is: \n#{array1}"
    end

    def task4
        array = input_array
        puts "The available array is: \n#{array}"
        array.map!{ |element| element*2 }
        puts "The required array with double values is : \n#{array}"
    end

    def task5
        array = input_array
        puts "The available array is: \n#{array}"
        array.map!{ |element| (element.is_a? Integer) ? element*2 : element }
        puts "The required array with double values is : \n#{array}"
    end

    def task6
        array = input_array
        puts "The available array is: \n#{array}"
        frequency= Hash.new(0)
        array.each{ |element| frequency[element] +=1 }
        puts "The frequency of elements in the given array is :\n#{frequency}"
    end

    def task7
        require "csv"
        csv =  CSV.open('test.csv', 'wb')
        puts "enter the no. of rows: "
        number_of_rows = gets.chomp.to_i
        for row_num in 0...number_of_rows
            row = []
            p "Enter the first element of row #{row_num + 1} "
            row[0] = gets.chomp.to_i
            p "Enter the second element of row #{row_num + 1} "
            row[1] = gets.chomp.to_i
            row[2] = row[0] * row[1]
            csv << row
        end
        csv.close
    end

    def task8
        matrix = input_matrix
        puts "Given Matrix is :"
        display_matrix matrix
        dimension = matrix.length
        for row_num in 0...dimension
            for col_num in row_num...dimension
                temp = matrix[row_num][col_num]
                matrix[row_num][col_num] = matrix[col_num][row_num]
                matrix[col_num][row_num] = temp
            end
        end
        puts "Your required transpose matrix is :\n"
        display_matrix matrix
    end

    def initialize
        puts "Welcome to the Day_1 Task of Ruby Training"
        num = 0 
        while num != 9
            display_Option
            num = gets.chomp.to_i
            case num
            when 1
                task1
            when 2
                task2
            when 3
                task3
            when 4
                task4
            when 5
                task5
            when 6
                task6
            when 7
                task7
            when 8
                task8
            when 9
                break
            else
                p "Invalid Input"  
            end
            num = want_to_play
        end
        puts "Thanks for Playing"
    end

    private
    
    def input_array
        puts"please enter the array elements separated by (,) without spacing and other than 0"
        input = gets.chomp.split(',')
        input.map! { |element| element.to_i != 0 ? element.to_i : element }
    end

    def input_matrix
        p "Enter the no. of rows of matrix : "
        dimension = gets.chomp.to_i
        matrix = Array.new
        for row_num in 0...dimension
            row= []
            for col_num in 0...dimension
                p "Enter the value of col: #{col_num + 1} of row: #{row_num + 1 }"
                row[col_num] = gets.chomp.to_i
            end
            matrix.push(row)
        end
        matrix
    end

    def display_matrix matrix
        matrix.each { |row| p row}
    end 

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
    end

    def want_to_play
        p "Want to Play Again (Y/N):"
        choice = gets.chomp
        if choice == "Y" || choice == 'y'
            return 0
        else
            return 9
        end
    end

end

#just initialize the object
task = Task.new