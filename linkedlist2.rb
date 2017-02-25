class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(node, previous=nil)
    # loop that goes through the list
    while node
        # get and store the next node to use it later as a previous value
        next_previous = node.next_node
        # switch the pointer to the next node to the previous value
        node.next_node = previous
        # previous sucks up the value of the current node
        previous = node
        # the current node becomes the former next node (now the previous node)
        node = next_previous
    end
    # return value of new head (previous tail)
    return previous
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
puts "---------"
revlist = reverse_list(node3)
print_values(revlist)
