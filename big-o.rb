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