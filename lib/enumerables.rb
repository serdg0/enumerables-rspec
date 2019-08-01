module Enumerable

    def my_each
        i = 0
        while i < self.size
            yield(self[i])
            i += 1
        end
        self
    end

    def my_each_index
        i = 0
        while i < self.size
            yield(self[i],i)
            i += 1
        end
    end

    def my_select
        arr_selection = []
        self.my_each{|x| arr_selection << x if yield(x)}
        arr_selection
    end

    def my_all?
        self.my_each do |x|
        return true unless block_given?
        return false unless yield(x)
        end
        true
    end
    
    def my_any?
        statement = false
        self.my_each do |x|
            (statement = true) if yield(x)
        end
        statement
    end

    def my_none?
        statement = true
        self.my_each{ |x| statement = false if yield(x) }
        statement
    end

    def my_count
        count = 0
        self.my_each do |x|
            block_given? ? (count += 1 if yield(x)) : count += 1
        end
        count
    end

    def my_map
        array = []
        self.my_each do |x|
            yield(x) ? (array << true) : (array << false)
        end
        array
    end
        
    def my_inject (memo = self[0])
        object = memo
        self.my_each do |x|
            object = yield(memo,x)
            memo = object 
        end
        object
    end
    
end