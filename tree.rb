class Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def depth_first_search(num) #check current elements, then check children
    current_node = self
    if current_node.payload != num
      current_node.children.each do |child|
        found_node = child.depth_first_search(num)
        if found_node
          return found_node
        end
      end
      return nil
    else
      return current_node
    end
  end

  def breadth_first_search(num)
    current_node = self
    queue = Queue.new
    while current_node
      if current_node.payload == num
        return current_node
      else
        current_node.children.each do |child|
          queue.enqueue(child)
        end
      end
      current_node = queue.dequeue
    end
    return nil
  end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

if !trunk.depth_first_search(11).nil?
  print trunk.depth_first_search(11).payload
end

if !trunk.breadth_first_search(11).nil?
  print trunk.breadth_first_search(11).payload
end
