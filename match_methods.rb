require_relative 'custom_enumerables'

arr = [1, 2, 3, 7, 5]
arr2 = [2, 2, 2, 4, 4]
str_arr = %w[Mario Bowser Luigi Peach]
hash1 = { 'a' => 1, 'b' => 1, 'c' => 3, 'd' => 4 }

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
p arr2.my_all?(2)
p arr2.my_all?(&:even?)
puts "\n"
p arr2.all?(2)
p arr2.all?(&:even?)
puts "\n"

puts 'my_any? vs any?'
p arr.my_any?(5)
p arr.my_any? { |i| i > 6 }
puts "\n"
p arr.any?(5)
p arr.any? { |i| i > 6 }
puts "\n"

puts 'my_none? vs none?'
p arr.my_none?(9)
p arr.my_none? { |i| i > 6 }
puts "\n"
p arr.none?(9)
p arr.none? { |i| i > 6 }
puts "\n"

puts 'my_count vs count'
puts arr.my_count(&:odd?)
p arr2.my_count(4)
puts "\n"
p arr.count(&:odd?)
p arr2.count(4)
puts "\n"

puts 'my_map vs map'
p arr.my_map { |item| item * 2 }
p arr.my_map(&:even?)
# puts "\n"
p arr.map { |item| item * 2 }
p arr.map(&:even?)
puts "\n"

