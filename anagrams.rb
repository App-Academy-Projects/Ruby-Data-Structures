## O(N!)
def first_anagram?(str1, str2)
    str1_arr = str1.chars
    str1_anag = str1_arr.permutation.to_a # O(N!) --> N: Number of permutations in str1
    str2_arr = str2.chars
    str1_anag.any? do |anag| # O(N)
        str2_arr == anag
    end
end

p first_anagram?("elvis", "lives")


# O(N^2)
def second_anagram?(str1, str2)
    return false if str1.length != str2.length # O(1)
    str2_arr = str2.chars # O(N)
    str1.each_char do |c| # O(N)
        ind = str2_arr.find_index(c) # O(log(N))
        str2_arr.delete_at(ind) unless ind.nil? # O(N)
    end
    return true if str2_arr.empty?
    false
end

p second_anagram?("lives", "ivels")
p second_anagram?("hello", "ollhs")


# O(N log(N))
def third_anagram?(str1, str2)
    str1_arr = str1.chars # O(N)
    str2_arr = str2.chars # O(N)

    # Sort the 2 arrays
    str1_arr.sort! # O(N log(N))
    str2_arr.sort! # O(N log(N))
    return str1_arr == str2_arr
end

p third_anagram?("live", "vile")
p third_anagram?("that's ok", "thats ok")


def fourth_anagram?(str1, str2)
    str1_hash = Hash.new(0)
    str2_hash = Hash.new(0)

    str1.each_char do |c|
        str1_hash[c] += 1
    end

    str2.each_char do |c|
        str2_hash[c] += 1
    end

    str1_hash.each do |k, v|
        return false unless v == str2_hash[k]
    end
    true
end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")