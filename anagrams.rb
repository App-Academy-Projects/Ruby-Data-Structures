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


def second_anagram?(str1, str2)
    return false if str1.length != str2.length
    str2_arr = str2.chars
    str1.each_char do |c|
        ind = str2_arr.find_index(c)
        str2_arr.delete_at(ind) unless ind.nil?
    end
    return true if str2_arr.empty?
    false
end

p second_anagram?("lives", "ivels")
p second_anagram?("hello", "ollhs")