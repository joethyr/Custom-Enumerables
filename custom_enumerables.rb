module Enumerable
  def my_each
    for k, v in self do
      yield(k, v)
    end
  end

  def my_each_with_index
    iterator = 0
      for i in self
        yield i, iterator
        iterator += 1
      end
    end
end

