class Stack
  attr_accessor :elements
  def initialize
    @elements = []
  end
  
  def push( item )
    @elements << item
  end
  
  def pop
    item = @elements[@elements.length - 1]
    @elements.delete_at( @elements.length - 1)
    item
  end
  
  def count
    @elements.count
  end
end