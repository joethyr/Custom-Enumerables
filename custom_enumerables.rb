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

  def my_select(&block)
    return to_enum(:my_select) unless block_given?

    arr = []
    hash = {}

    case self
    when Array
      self.my_each { |item| arr.push(item) if block.call(item) }
      arr
    when Hash
      self.my_each { |k, v|  hash[k] = v if block.call(k, v) }
      hash
    end
  end
end

