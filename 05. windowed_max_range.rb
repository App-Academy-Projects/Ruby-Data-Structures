# Time Complexity: O(N)
# Space Complexity: O(N)
def windowed_max_range(arr, w)
    current_max_range = nil
    len = arr.length
    (0..len-w).each do |i| # O(N)
        window = arr[i...i+w] # O(N)
        min = window.min # O(N)
        max = window.max # O(N)
        current_max_range ||= window
        if (max - min) > current_max_range[-1] - current_max_range[0]
            current_max_range = window
        end
    end
    current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # 3, 2, 5, 4, 8


 class MyQueue
     def initialize
         @store = []
     end
     
     def peek
         @store.first
     end

     def size
         @store.length
     end

     def empty?
         @store.empty?
     end

     def enqueue(el)
         @store << el
     end

     def dequeue
        @store.shift
     end
 end

 
 class MyStack
     def initialize
         @store = []
     end

     def peek
         @store.last
     end

     def empty?
         @store.empty?
     end

     def push(el)
         @store.unshift(el)
     end

     def pop
         @store.pop
     end
 end

class StackQueue
    def initialize
        @in_stack = MyStack.new
        @out_stack = MyStack.new
    end

    def size
        @in_stack.size + @out_stack.size
    end

    def empty?
        @in_stack.empty? && @out_stack.empty?
    end

    def enqueue(el)
        @in_stack.push(el)
    end

    def dequeue
        @out_stack.pop unless @out_stack.empty?
    end
end

class MinMaxStack
    def initialize
        @store = MyStack.new
    end

    def peek
        @store.peek unless empty?
    end
end