module Enumerable
  def my_each
    for number in self do
      yield(number)
    end
  end
end



puts "my_each vs. each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each  { |item| puts item }
puts "\n"
numbers.each  { |item| puts item }
