class Image
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def blur_one_time
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
      @arr[y][x-1] = 1 unless x-1 < 0
      @arr[y][x+1] = 1 unless x+1 >= @arr[y].length
      @arr[y-1][x] = 1 unless y-1 < 0
      @arr[y+1][x] = 1 unless y+1 >= @arr.length
    end
  end

  def blur(distance)
    x = distance.to_i
    x.times { blur_one_time }
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
image.blur(3)
image.output_image