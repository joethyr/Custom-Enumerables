require_relative 'custom_enumerables'

arr = [1, 2, 3, 4, 5]
str_arr = %w[Mario Bowser Luigi Peach]
hash1 = { 'a' => 1, 'b' => 2, 'c' => 3 }

puts "my_each vs. each"
arr.my_each  { |item| puts item }
hash1.my_each { |k, v| puts "#{k}, #{v}" }
puts "\n"
arr.each  { |item| puts item }
hash1.each { |k, v| puts "#{k}, #{v}" }
puts "\n"

puts 'my_each_with_index vs each_with_index'
str_arr.my_each_with_index { |item, index|
  puts "#{item}: #{index}"}
puts "\n"
str_arr.each_with_index { |item, index|
  puts "#{item}: #{index}"}
puts "\n"

puts 'my_select vs select'
p arr.my_select { |item| item.even? }
p hash1.my_select { |_, v| v > 1 }
puts "\n"
p arr.select { |item| item.even? }
p hash1.select { |_, v| v > 1 }
puts "\n"

puts 'my_all? vs all?'
p arr.my_all?(&:even?)
p hash1.my_all? { |_, v| v >= 1 }
puts "\n"
p arr.all?(&:even?)
p hash1.all? { |_, v| v >= 1 }
puts "\n"

