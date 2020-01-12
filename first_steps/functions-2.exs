fizzbuzz = fn
  0, 0, _ -> IO.puts "FizzBuzz"
  0, _, _ -> IO.puts "Fizz"
  _, 0, z -> IO.puts z
end

IO.puts fizzbuzz.(0, 0, 1)

IO.puts fizzbuzz.(0, 1, 2)

IO.puts fizzbuzz.(1, 0, 3)