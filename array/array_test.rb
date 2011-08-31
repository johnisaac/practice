require './array.rb'
require 'test/unit'

class ArrayTest < Test::Unit::TestCase
  def setup
    @array = MyArray.new
  end
  
  def test_an_object_of_myarray_is_created
    assert @array.instance_of? MyArray
  end
  
  def test_initially_array_is_of_length_zero
    assert_equal 0, @array.size
  end
  
  
  def test_push_method_adds_an_element_to_the_myarray
    @array << 1
    assert_equal 1, @array.size
  end
  
  def test_check_whether_push_method_adds_an_element_to_the_myarray
    @array.push(1)
    assert_equal 1, @array.size
  end
  
  def test_myarray_should_be_able_to_retrieve_an_element_based_on_its_index
    @array << 1
    assert_equal 1, @array[0]
    
    @array << 2
    assert_equal 2, @array[1]
  end
  
  def test_myarray_should_be_able_to_use_assignment_value
    @array[0] = 1
    assert_equal 1, @array[0]
  end
  
  def test_to_s_should_a_return_version
    @array << 1
    @array << 2

    assert_equal "[1,2]", @array.to_s
  end
  
  def test_delete_at_should_delete_the_item_at_the_index
    @array << 1
    @array << 2
    @array << 3
    @array << 4
    
    assert_equal 4, @array.length
    
    deleted_item = @array.delete_at( 0 )
    
    assert_equal 1, deleted_item
    assert_equal 3, @array.length, " Item was not deleted"
  end
  
  def test_delete_at_should_return_nil_if_index_is_greater_than_size
    @array << 1
    @array << 2
    @array << 3
    @array << 4
    
    deleted_item = @array.delete_at(10)
    
    assert_equal nil, deleted_item
    assert_equal 4, @array.length
  end
end