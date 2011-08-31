require '../lib/common.rb'
require '../array/array.rb'

class LinkedList
  attr_reader :head, :current
  
  def initialize
    @list = MyArray.new
    @head = nil
    @current = nil
  end
end