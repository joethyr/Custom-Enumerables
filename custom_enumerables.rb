module Enumerable
  def my_each
    for k, v in self do
      yield(k, v)
    end
  end
end

