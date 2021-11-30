module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for k, v in self do
      yield(k, v)
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    iterator = 0
      for i in self
        yield i, iterator
        iterator += 1
      end
    end
end

