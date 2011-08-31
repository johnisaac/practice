require '../lib/common.rb'
require '../array/array.rb'

class Queue
  include Common
  
  attr_accessor :elements
  def initialize
    @elements = MyArray.new
  end
  
  def pop
    item = @elements[0]
    @elements.delete_at( 0 )
    item
  end
end