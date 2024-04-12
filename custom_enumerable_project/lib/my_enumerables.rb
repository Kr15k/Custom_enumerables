module Enumerable
  # Your code goes here

  def my_all?
    my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_count
    return size unless block_given?

    count = 0
    my_each do |elem|
      count += 1 if yield(elem)
    end
    count
  end

  def my_each_with_index
    i = 0
    self.my_each do |elem|
      yield(elem, i)
      i += 1
    end
  end

  def my_inject(def_val = 0)
    sum = def_val
    self.my_each do |elem|
      sum = yield(sum, elem)
    end
    sum
  end

  def my_map
    arr = []
    self.my_each do |elem|
      arr << yield(elem)
    end
    arr
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_select
    arr = []
    self.my_each do |elem|
      arr.push(elem) if yield(elem)
    end
    arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end
