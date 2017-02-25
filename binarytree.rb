class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end

  def add_value(num)
    if num < self.payload
      if self.left.nil?
        self.left = BinaryTree.new(num, nil, nil)
      else
        self.left.add_value(num)
      end
    elsif num > self.payload
      if self.right.nil?
        self.right = BinaryTree.new(num, nil, nil)
      else
        self.right.add_value(num)
      end
    end
  end

  def add_list(arr)
    arr.each do |num|
      add_value(num)
    end
    self
  end

  def sorted_array(current_node = self, sorted = [])
    if !current_node.left.nil?
      sorted_array(current_node.left, sorted)
    end
    sorted.push(current_node.payload)
    if !current_node.right.nil?
      sorted_array(current_node.right, sorted)
    end
    return sorted
  end

end

list = [7, 4, 9, 1, 6, 14, 10]

trunk = BinaryTree.new(8, nil, nil)
print trunk.add_list(list)
print trunk.sorted_array

