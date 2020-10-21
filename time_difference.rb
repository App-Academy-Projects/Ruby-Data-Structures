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

def my_min2(list)
    smallest_num = Float::INFINITY
    list.each do |n|
        smallest_num = n if n < smallest_num
    end
    smallest_num
end

p my_min2(list)  # =>  -5



def sub_arrays_of(list)
    sub_arrs = []
    len = list.length
    (0...len).each do |i|
        (0...len).each do |j|
            sub_arr = list[i..j]
            sub_arrs << sub_arr unless sub_arr == []
        end
    end
    sub_arrs
end