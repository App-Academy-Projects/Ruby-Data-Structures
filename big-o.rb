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