class Queue
  attr_accessor :elements
  def initialize
    @elements = []
  end
  
  def push( item )
    @elements << item
    @elements
  end
  
  def pop
    item = @elements[0]
    @elements.delete_at( 0 )
    item
  end
  
  def count
    @elements.count
  end
end