Fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Find the longest fish in an array of fish
def sluggish_octopus
    # O(N^2)
    longest_fish = ""
    Fishes.each do |fish1|
        Fishes.each do |fish2|
            longest_fish = fish2 if fish2.length > fish1.length
        end
    end
    longest_fish
end

p sluggish_octopus

def dominant_octopus
    # O(N log(N))
    len = Fishes.length
    longest_fish = ""
    i = 0
    while i < len
        j = len - 1
        current_fish_len = Fishes[i].length
        while j > 0
            longest_fish = Fishes[i] if current_fish_len > Fishes[j].length
            j /= 2
        end
        i += 1
    end
    longest_fish
end

p dominant_octopus


def clever_octopus
    # O(N)
    longest_fish = ""
    Fishes.each do |fish|
        longest_fish = fish if fish.length > longest_fish.length
    end
    longest_fish
end

p clever_octopus


# Dancing Octopus
def slow_dance(word, search_arr)
    search_arr.each_with_index do |w, i|
        return i if w == word
    end
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

p slow_dance("up", tiles_array)

p slow_dance("right-down", tiles_array)

def fast_dance(word, tiles_hash)
    return tiles_hash[word]
end

# Test 

hash_tiles_array = Hash.new
tiles_array.each_with_index do |w, i|
    hash_tiles_array[w] = i
end
p fast_dance("up", hash_tiles_array)

p fast_dance("right-down", hash_tiles_array)