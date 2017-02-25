class Image
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def blur(distance, &distance_function)
    distance_function ||= Proc.new { |x, y, x2, y2| ((x-x2).abs + (y-y2).abs) }
    # Empty array to hold x, y coords with values of "1"
    to_be_changed = Array.new
    # Loop through array to find x, y coords with values of "1"
    @arr.each_index do |y|
      subarray = @arr[y]
      subarray.each_index do |x|
        if subarray[x] == 1
          to_be_changed.push([x, y])
        end
      end
    end
    # Change surrounding 0's to 1's for each x, y coord
    to_be_changed.each do |coords|
      x = coords[0]
      y = coords[1]
      @arr.each_with_index do |row, y2| # row = array contents at index, y2 = index
        row.each_index do |x2|
          # calculate distance of x2, y2 from x, y
          if distance_function.call(x, y, x2, y2) <= distance
            @arr[y2][x2] = 1
          end
        end
      end
    end
  end

  def output_image
    @arr.each do |current_array|
      current_array.each do |a|
        print a
      end
      print "\n"
    end
  end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1],
])
image.blur(3) { |x, y, x2, y2| Math.sqrt((x-x2)**2 + (y-y2)**2) }
image.output_image