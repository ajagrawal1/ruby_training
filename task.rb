=begin  //task 8
    matrix = [[1,2,3],[4,5,6],[7,8,9]]
    p matrix
    n=matrix.length
    for i in 0...n
        for j in i...n
            temp= matrix[i][j]
            matrix[i][j]=matrix[j][i]
            matrix[j][i]=temp
        end
    end
    p matrix
=end

=begin  //task 7
    require "csv"
    rows = CSV.read("test.csv")
    n=rows.length
    for i in 0...n
        row = rows[i]
        row=row[0].to_i * row[1].to_i 
        rows[i].push(row)
    end
    p rows
    CSV.open('test.csv', 'wb') {
        |csv|

        rows.each{
        |row|
        csv << row
        }

    }
=end

=begin  //task 6
    array=[1,2,3,1,2,3,1,2,1,2,'a','a','1']
    frequency= Hash.new(0)
    array.each do |element|
        frequency[element] +=1
    end
    p frequency
=end

=begin  //task 5
    def double_array a
        result= a.map do |x|
            if x.is_a?Integer
                x*=2
            else
                x
            end
        end
        p result
    end
    arr = [1,2,3,'a']
    double_array(arr)
=end

=begin  //task 4
    def double_array a
        p a.map{|x| x*=2}
    end
    arr = [1,2,3,'a']
    double_array(arr)
=end

=begin  //task 3
    array1=[1,2,3,4]
    array2=[5,6,7,8]
    # array3= array1+ array2
    # p array3

    def array_join arr1, arr2
    l1=arr1.length
    l2= arr2.length
    l2.times do |index|
            arr1[l1+index] = arr2[index]
    end
    p arr1
    end

    array_join array1, array2
=end

=begin  //task 2
    def array_check arr,x
        arr.each do |e|
            if e == x
                p "yes "
                return 
            end
        end
        p "No"
    end

    a = [1,2,3,4,5,6]
    array_check a , 7
=end

=begin  //task 1
    for x in (1..100)
        p x
    end
=end


