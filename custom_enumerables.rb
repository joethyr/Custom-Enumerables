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

  def my_select
    return to_enum(:my_select) unless block_given?

    arr = []
    hash = {}

    case self
    in Array
      self.my_each { |item| arr.push(item) if yield(item) }
      arr
    in Hash
      self.my_each { |k, v|  hash[k] = v if yield(k, v) }
      hash
    end
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    case self
    in Array
      self.my_each { |item| return false unless yield(item) }
      true
    in Hash
      self.my_each { |k, v| return false unless yield(k, v) }
      true
    end
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    case self
    in Array
      self.my_each { |item| return true while yield(item) }
      false
    in Hash
      self.my_each { |k, v| return true while yield(k, v) }
      false
    end
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    case self
    in Array
      self.my_each { |item| return false while yield(item) }
      true
    in Hash
      self.my_each { |k, v| return false while yield(k, v) }
      true
    end
  end

  def my_count
    return to_enum(:my_count) unless block_given?

    count = 0
    self.my_each { |i| count += 1 if yield(i) }
    count
  end
end

