require_relative 'custom_enumerables'

numbers = [1, 2, 3, 4, 5]
str_arr = %w[Mario Bowser Luigi Peach]

puts "my_each vs. each"
numbers.my_each  { |item| puts item }
{ 'a' => 1, 'b' => 2 }.my_each { |k, v| puts "#{k}, #{v}" }
puts "\n"
numbers.each  { |item| puts item }
{ 'a' => 1, 'b' => 2 }.each { |k, v| puts "#{k}, #{v}" }
puts "\n"

puts 'my_each_with_index vs each_with_index'
str_arr.my_each_with_index { |item, index|
  puts "#{item}: #{index}"}
puts "\n"
str_arr.each_with_index { |item, index|
  puts "#{item}: #{index}"}
puts "\n"
