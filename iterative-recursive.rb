value_array = [1, 'all', 4, 53, 'Cats', 24, 'Bilbo Swaggins', 12, 74, 'Wowwie', 23, 60, 13, 46, 'That is amazing']

def iterative(arr)
  sum = 0
  arr.each do |val|
    if val.is_a?(String)
      char_sum = 0
      val.split("").each do |char|
        char_val = 0
        if char.ord >= 97 && char.ord <= 122
          char_val = char.ord - 96
        elsif char.ord >= 65 && char.ord <= 90
          char_val = char.ord - 38
        end
        char_sum += char_val
      end
      val = char_sum
    end
    sum += val
  end
  sum
end

puts iterative(value_array)

def recursive(arr, index=0, sum=0)
  value = arr[index]
  if arr.length == index
    return sum
  elsif arr[index].is_a?(String)
    char_sum = 0
    arr[index].split("").each do |char|
      char_val = 0
      if char.ord >= 97 && char.ord <= 122
        char_val = char.ord - 96
      elsif char.ord >= 65 && char.ord <= 90
        char_val = char.ord - 38
      end
      char_sum += char_val
      end
    value = char_sum
  end
  sum += value
  index += 1
  recursive(arr, index, sum)
end

puts recursive(value_array)
