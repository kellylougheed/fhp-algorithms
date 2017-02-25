# iterative solution
def fib(n)
  if n == 0 || n == 1
    return n
  end
  seq = [0, 1]
  i = 2
  while i <= n
    sum = seq[i-1] + seq[i-2]
    seq << sum
    i = i + 1
  end
  seq[n]
end

# recursive solution
def recursive_fib(n)
  if n < 2
    return n
  end

  recursive_fib(n-1) + recursive_fib(n-2)
end

# test

100.times do |n|
  fib(n)
end

# i = 0
# while i <= 9
#   print fib(i)
#   print "\n"
#   i = i + 1
# end