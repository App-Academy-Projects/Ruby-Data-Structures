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


# Time Complexity: O(N log(N))
# Space Complexity: O(N)
def okay_two_sum?(arr, target_sum)
    sorted_arr = arr.sort # O(N log(N))
    len = arr.length
    (0...len).each do |i| # O(N)
        ind = sorted_arr.bsearch_index { |el| (target_sum - sorted_arr[i]) <=> el }
        return true unless ind.nil? || ind == i # O(1)
    end
    false
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false


# Time Complexity: O(N)
# Space Complexity: O(N)
def perfect_two_sum?(arr, target_sum)
    complements = {}
    arr.each_with_index do |el, i| # O(N)
        complement, _ = complements[target_sum - el] # O(1)
        return true if complement # O(1)
        complements[el] = [el, i] # O(1)
    end
    false
end

p perfect_two_sum?(arr, 6) # => should be true
p perfect_two_sum?(arr, 10) # => should be false