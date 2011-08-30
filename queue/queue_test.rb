require './queue.rb'
require 'test/unit'

class QueueTest < Test::Unit::TestCase
  def setup
    @queue = Queue.new
  end
  
  def test_an_object_of_queue_is_created
    assert_equal @queue.class, Queue
  end
  
  def test_object_must_have_an_element_array
    assert_not_nil @queue.elements
  end
  
  def test_object_must_have_an_zero_element_array
    assert_equal 0, @queue.count
  end
  
  def test_object_must_append_the_argument_to_the_end_of_the_element_array_when_pushed
    @queue.push( 1 )
    assert_equal 1, @queue.count
  end
  
  def test_object_must_remove_an_element_from_the_end_of_an_array_when_popped
    @queue.push( 1 )
    assert_equal 1, @queue.count
    @queue.pop
    assert_equal 0, @queue.count
  end
  
  def test_object_must_pop_an_element_from_the_end_of_an_array_which_was_previously_pushed
    @queue.push( 1 )
    assert_equal 1, @queue.count
    @queue.push( 1 )
    assert_equal 2, @queue.count
    item = @queue.pop
    assert_equal item, 1
    assert_equal 1, @queue.count
  end
end