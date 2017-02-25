class Collatz

  def initialize
    @data_store = {}
  end

def collatz(n)
  collatz_seq = [n]
  while n != 1
    if n % 2 == 0
      n = n/2
    else
      n = 3*n + 1
    end
    collatz_seq << n
  end
  return collatz_seq
end

def collatz_length(n)
  if n == 1
    1
  elsif n % 2 == 0
    @data_store[n] ||= 1 + collatz_length(n/2)
  else
    @data_store[n] ||= 1 + collatz_length(3*n + 1)
  end
end

def longest_collatz(limit)
  longest = 0
  counter = 1
  number_with_longest = 0
  while counter < limit
    length = collatz_length(counter)
    if length > longest
      longest = length
      number_with_longest = counter
    end
    counter = counter + 1
  end
  return number_with_longest
end

end

print Collatz.new.longest_collatz(1000000)
