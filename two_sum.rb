# Time Complexity: O(N^2)
# Space Complexity: O(1)
def bad_two_sum?(arr, target_sum)
    len = arr.length
    (0...len).each do |i| # O(N)
        cur = arr[i]
        (0...len).each do |j| # O(N)
            next if i == j
            return true if target_sum == cur + arr[j]
        end
    end
    false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false


# Time Complexity: O(N)
# Space Complexity: O(N)
def okay_two_sum?(arr, target_sum)
    sorted_arr = arr.dup.sort! # O(N)
    len = arr.length
    (0...len-1).each do |i| # O(N)
        return true if target_sum == arr[i] + arr[i-1] # O(1)
    end
    false
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false