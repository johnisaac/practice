require '../lib/common.rb'

class Stack
  include Common
  
  attr_accessor :elements
  def initialize
    @elements = []
  end
  
  def pop
    item = @elements[@elements.length - 1]
    @elements.delete_at( @elements.length - 1 )
    item
  end
end