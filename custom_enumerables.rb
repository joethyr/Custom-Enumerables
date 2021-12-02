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

  def my_all?(pattern = nil)
    if block_given?
      self.my_each { |item| return false unless yield(item) }
    elsif pattern
      self.my_each { |item| return false unless pattern == item }
    else
      self.my_each { |item| return false unless item }
    end
    true
  end

  def my_any?(pattern = nil)
    if block_given?
      self.my_each { |item| return true while yield(item) }
    elsif pattern
      self.my_each { |item| return true while pattern == item }
    else
      self.my_each { |item| return true while item }
    end
    false
  end

  def my_none?(pattern = nil)
    if block_given?
      self.my_each { |item| return false while yield(item) }
    elsif pattern
      self.my_each { |item| return false while pattern == item }
    else
      self.my_each { |item| return false while item }
    end
    true
  end

  def my_count(pattern = nil)
    count = 0
    if block_given?
      self.my_each { |item| count += 1 if yield(item) }
    elsif pattern
      self.my_each { |item| count +=1 if pattern == item}
    end
    count
  end
end
