require './linked_list.rb'
require 'test/unit'

class LinkedListTest < Test::Unit::TestCase
  def setup
    @ll = LinkedList.new
  end
  
  def test_object_should_be_of_class_linked_list
    assert_equal LinkedList, @ll.class
  end
  
  
end
