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

     def size
         @store.length
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
        queueify if @out_stack.empty?
        @out_stack.pop unless @out_stack.empty?
    end

    private
    def queueify
        @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end
end

class MinMaxStack
    def initialize
        @store = MyStack.new
    end

    def peek
        @store.peek unless empty?
    end

    def empty?
        @store.empty?
    end

    def size
        @store.size
    end

    def max
        @store.peek[:max] unless empty?
    end

    def min
        @store.peek[:min] unless empty?
    end

    def pop
        @store.pop[:val] unless empty?
    end

    def push(el)
        @store.push ({
            max: new_max(el),
            min: new_min(el),
            val: el
        })
    end

    private
    def new_max(el)
        empty? ? el : [max, el].max
    end

    def new_min(el)
        empty? ? el : [min, el].min
    end
end


class MinMaxStackQueue
    def initialize
        @in_stack = MinMaxStack.new
        @out_stack = MinMaxStack.new
    end
    
    def size
        @in_stack.size + @out_stack.size
    end

    def empty?
        @in_stack.empty? && @out_stack.empty?
    end
        
    def enqueue(val)
        @in_stack.push(val)
    end
    
    def dequeue
        queueify if @out_stack.empty?
        @out_stack.pop unless empty?
    end

    def max
        maxs = []
        maxs << @in_stack.max unless @in_stack.empty?
        maxs << @out_stack.max unless @out_stack.empty?
        maxs.max
    end

    def min
        mins = []
        mins << @in_stack.min unless @in_stack.empty?
        mins << @out_stack.min unless @out_stack.empty?
        mins.min
    end

    private
    def queueify
        @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end
end


def max_windowed_range(arr, window_size)
  queue = MinMaxStackQueue.new
  best_range = nil

  arr.each_with_index do |el, i|
    queue.enqueue(el)
    queue.dequeue if queue.size > window_size

    if queue.size == window_size
      current_range = queue.max - queue.min
      best_range = current_range if !best_range || current_range > best_range
    end
  end

  best_range
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 2)