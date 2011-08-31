require '../lib/common.rb'
require '../array/array.rb'

class Stack
  include Common
  
  attr_accessor :elements
  def initialize
    @elements = MyArray.new
  end
  
  def pop
    item = @elements[@elements.length - 1]
    @elements.delete_at( @elements.length - 1 )
    item
  end
  
end