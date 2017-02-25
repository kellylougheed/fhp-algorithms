class Image

  attr_accessor :arr

  def initialize(arr)
    @arr = arr
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
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image