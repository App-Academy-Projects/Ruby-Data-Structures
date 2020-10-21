def my_min(list)
    smallest_num = nil
    list.each do |n1|
        smallest_num = n1
        list.each do |n2|
            smallest_num = n2 if n2 < smallest_num
        end
    end
    smallest_num
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5