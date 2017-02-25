def luhn(card)
  card = card.to_s
  num_arr = card.split(//).map(&:to_i)
  num_arr2 = []
  num_arr.each_with_index do |num, index|
    if index % 2 == 0
      num = num*2
    end
    num_arr2 << num
  end
  num_arr3 = []
  num_arr2.each do |num|
    if num >= 10
      num = num - 9
    end
    num_arr3 << num
  end
  sum = 0
  num_arr3.each do |num|
    sum += num
  end
  if sum % 10 == 0
    true
  else
    false
  end
end

print luhn(377681478627336)