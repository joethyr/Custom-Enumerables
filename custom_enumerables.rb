module Enumerable
  def my_each
    for k, v in self do
      yield(k, v)
    end
  end
end

puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each  { |item| puts item }
{ 'a' => 1, 'b' => 2 }.my_each { |k, v| puts "#{k}, #{v}" }


puts "\n"
numbers.each  { |item| puts item }
{ 'a' => 1, 'b' => 2 }.each { |k, v| puts "#{k}, #{v}" }
