class MyArray
  include Enumerable
  attr_reader :size
  
  def initialize
    @size = 0
  end
  
  def << (item) 
    # i need a place to store this thing
    instance_variable_set( "@a#{@size}", item)
    @size += 1
  end
  
  def [](index)
    instance_variable_get("@a#{index}")
  end
  
  def []=(index, item)
    instance_variable_set("@a#{index}",item)
  end
  
  def to_s
    s = "["
    s = s + inject{|sum, n| "#{sum},#{n}" }
    s = s + "]"
    s
  end
  
  def each
    0.upto(@size-1){|n| yield self[n] }
  end
  
  def length
    @size
  end
  
  def delete_at(index)
    # if the index is larger than tha length of the array, return nil
    return nil if index > @size
    
    #else
    #  remove the item and store it somewhere
    #  move all the items after the index one place ahead
    deleted_item = self[index]
    
    while index < @size-1
      self[index] = self[index+1]
      index += 1
    end
    
    @size -= 1
    
    deleted_item
  end
  alias :push :<<
end