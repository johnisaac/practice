require 'test/unit'
require './stack.rb'

class StackTest < Test::Unit::TestCase
  def setup
    @stack = Stack.new
  end
  
  def test_an_object_of_stack_is_created
    assert_equal @stack.class, Stack
  end
  
  def test_object_must_have_an_element_array
    assert_not_nil @stack.elements
  end
  
  def test_object_must_have_an_zero_element_array
    assert_equal 0, @stack.count
  end
  
  def test_object_must_append_the_argument_to_the_end_of_the_element_array_when_pushed
    @stack.push( 1 )
    assert_equal 1, @stack.count
  end
  
  def test_object_must_remove_an_element_from_the_end_of_an_array_when_popped
    @stack.push( 1 )
    assert_equal 1, @stack.count
    @stack.pop
    assert_equal 0, @stack.count
  end
  
  def test_object_must_pop_an_element_from_the_end_of_an_array_which_was_previously_pushed
    @stack.push( 1 )
    assert_equal 1, @stack.count
    item = @stack.pop
    assert_equal item, 1
    assert_equal 0, @stack.count
  end
  
end