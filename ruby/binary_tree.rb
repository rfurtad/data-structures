class BinarySearchTree
    attr_accessor :root

    class Node
        attr_reader :value
        attr_accessor :left, :right

        def initialize(value = nil)
            @value = value
            @left, @right = nil, nil
        end
    end

    def initialize(node = nil)
        @root = node
    end

    def search(value, node = self, level = 0)            
        return "Value Not Found" if node.nil?
        return "Value is in level #{level}" if node.value == value
        return search(value, node.left, level + 1) if node.value > value
        return search(value, node.right, level + 1) if node.value < value            
    end

    def insert_node(nodes)
        return if nodes.empty?
        head, *tail = nodes            
        return @root = Node.new(head) if root.nil?     
        return insert_left_side(root, head) if root.value > head
        insert_right_side(root, head)            
        insert_node(tail)
    end

    def preorder(dado = self.root)        
        return ' ' unless dado
        print(' ' , dado.value)
        preorder(dado.left)                
        preorder(dado.right)        
    end

    def inorder(dado = self.root)        
        return ' ' unless dado
        inorder(dado.left)
        print(' ' , dado.value)                            
        inorder(dado.right)        
    end

    def posorder(dado = self.root)
        return ' ' unless dado                                                                     
        posorder(dado.left)
        posorder(dado.right)            
        print(' ' , dado.value)
    end

    private

    def insert_left_side(node, new_node)            
        return Node.new(new_node) if node.nil?        
        return insert_right_side(node, new_node) if node.value < new_node             
        node.left = insert_left_side(node.left, new_node)                                   
        node                                                                              
    end

    def insert_right_side(node, new_node)            
        return Node.new(new_node) if node.nil?
        return insert_left_side(node, new_node) if node.value > new_node
        node.right = insert_right_side(node.right, new_node)                        
        node
    end
end