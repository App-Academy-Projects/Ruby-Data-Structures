def bad_two_sum?(arr, target_sum)
    len = arr.length
    (0...len).each do |i|
        cur = arr[i]
        (0...len).each do |j|
            next if i == j
            return true if target_sum == cur + arr[j]
        end
    end
    false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
