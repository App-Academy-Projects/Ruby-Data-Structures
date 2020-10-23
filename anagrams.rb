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