class LinkedList
    attr_reader :head
    class Node
        attr_accessor :next, :value
        def initialize(value)
            @value = value
            @next = nil
        end
    end

    def initialize(node = nil)
        @head = node
    end

    def insert_node(current_node = @head, value)
        return @head = Node.new(value) unless @head
        return Node.new(value) unless current_node        
        current_node.next = insert_node(current_node.next, value)
        current_node
    end

    def print_list(list = self.head)            
        return unless list.next
        print(list.value, ' ')
        print_list(list.next)
    end

    def print_reverse_list(list)
        return print(list.value, ' ') unless list.next        
        print_list(list.next)
        print(list.value, ' ')
    end
end