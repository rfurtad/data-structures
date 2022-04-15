module BinaryTree
    class Node
        attr_reader :value
        attr_accessor :left, :right

        def initialize(value = nil)
            @value = value
            @left, @right = nil, nil
        end

        def insert_node(node_to_insert)        
            return insert_left_side(self, node_to_insert) if value > node_to_insert
            insert_right_side(self, node_to_insert)
        end

        def search(value, node = self, level = 0)            
            return "Value Not Found" if node.nil?
            return "Value is in level #{level}" if node.value == value
            return search(value, node.left, level + 1) if node.value > value
            return search(value, node.right, level + 1) if node.value < value            
        end

        def insert_multiple_nodes_recursively(nodes)
            return if nodes.empty?
            head, *tail = nodes            
            insert_node(head)            
            insert_multiple_nodes_recursively(tail)
        end

        def preorder(dado = self)        
            return ' ' unless dado
            print(' ' , dado.value)
            preorder(dado.left)                
            preorder(dado.right)        
        end

        def inorder(dado = self)        
            return ' ' unless dado
            inorder(dado.left)
            print(' ' , dado.value)                            
            inorder(dado.right)        
        end

        def posorder(dado = self)
            return ' ' unless dado                                                                     
            posorder(dado.left)
            posorder(dado.right)            
            print(' ' , dado.value)
        end

        private

        def insert_left_side(tree, new_node)            
            return Node.new(new_node) if tree.nil?
            return insert_right_side(tree, new_node) if tree.value < new_node             
            tree.left = insert_left_side(tree.left, new_node)                                   
            tree                                                                              
        end

        def insert_right_side(tree, new_node)            
            return Node.new(new_node) if tree.nil?
            return insert_left_side(tree, new_node) if tree.value > new_node
            tree.right = insert_right_side(tree.right, new_node)                        
            tree
        end        
    end
end