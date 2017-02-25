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

def is_infinite_loop?(first_node)

  tortoise = first_node.next_node
  hare = first_node.next_node.next_node
  while tortoise != hare
    if tortoise.next_node.nil? || hare.nil? || hare.next_node.nil?
      return false
    end
    tortoise = tortoise.next_node
    hare = hare.next_node.next_node
  end
  true
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

print is_infinite_loop?(node3)
