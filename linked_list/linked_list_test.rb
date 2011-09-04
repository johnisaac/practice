require './linked_list.rb'
require 'test/unit'

class LinkedListTest < Test::Unit::TestCase
  def setup
    @ll = LinkedList.new
  end
  
  def test_object_should_be_of_class_linked_list
    assert_equal LinkedList, @ll.class
  end
  
  def test_only_nodes_can_be_inserted_to_linked_list
    assert_raise TypeError do
      @ll.insertBefore(1)
    end
  end
  
  def test_node_data_cannot_be_nil
    assert_raise ArgumentError do
      node = Node.new
      @ll.insertBefore(node)
    end
  end
  
  def test_first_node_should_become_the_head
    node = Node.new({:datum => 1})
    @ll.insertBefore( node )
    assert_equal 1, @ll.size
    assert_equal @ll.head, node
    assert_equal @ll.head, @ll.current
  end
  
  def test_insert_before_should_prepend_the_current_node_to_the_current
    beforeNode = Node.new({:datum => 2})
    @ll.insertBefore( beforeNode )
    newNode = Node.new({:datum => 1})
    @ll.insertBefore( newNode, beforeNode )
    
    assert_equal @ll.head, newNode
    assert_equal 2, @ll.size
    assert_equal newNode, @ll.current
  end
  
  def test_to_s_should_return_a_string_representation
    thirdNode = Node.new({:datum => 3})
    @ll.insertBefore( thirdNode )
    firstNode = Node.new({:datum => 1})
    @ll.insertBefore( firstNode, thirdNode )
    secondNode = Node.new({:datum => 2})
    @ll.insertBefore( secondNode, thirdNode )
    
    assert_equal "1-->2-->3", @ll.to_s
  end
  
  def test_insert_before_should_prepend_the_current_node_to_the_current_and_attach_a_ref_to_the_behind_node
    thirdNode = Node.new({:datum => 3})
    @ll.insertBefore( thirdNode )
    firstNode = Node.new({:datum => 1})
    @ll.insertBefore( firstNode, thirdNode )
    secondNode = Node.new({:datum => 2})
    @ll.insertBefore( secondNode, thirdNode )
    
    assert_equal 3, @ll.size
    assert_equal "1-->2-->3", @ll.to_s
    
    reFirstNode = Node.new({:datum => 0})
    @ll.insertBefore( reFirstNode, firstNode )
        
    assert_equal 4, @ll.size
    assert_equal "0-->1-->2-->3", @ll.to_s
    assert_equal reFirstNode, @ll.head
  end
  
  def test_insert_after_should_insert_an_element_as_the_first_element_in_an_empty_linked_list
    secondNode = Node.new({:datum => 1})
    @ll.insertAfter( secondNode )
    
    assert_equal 1, @ll.size
    assert_equal @ll.head, secondNode
  end
  
  def test_insert_after_should_append_the_current_node_to_the_after_node
    secondNode = Node.new({:datum => 1})
    @ll.insertAfter( secondNode )
  
    thirdNode = Node.new({:datum => 2})
    @ll.insertAfter( thirdNode, secondNode )
    
    assert_equal 2, @ll.size
    assert_equal @ll.head, secondNode
    assert_equal @ll.tail, thirdNode
    assert_equal secondNode.ref, thirdNode
    assert_equal thirdNode.prev, secondNode
  end
  
  def test_insert_after_should_append_the_current_node_to_the_after_node_for_list_greater_than_2_nodes
    firstNode = Node.new({:datum => 1})
    @ll.insertAfter( firstNode )
    
    thirdNode = Node.new({:datum => 3})
    @ll.insertAfter( thirdNode, firstNode )
    
    secondNode = Node.new({:datum => 2})
    @ll.insertAfter( secondNode, firstNode )
    
    assert_equal 3, @ll.size
    assert_equal @ll.head, firstNode
    assert_equal @ll.tail, thirdNode
    assert_equal "1-->2-->3",@ll.to_s
  end
  
  def test_insert_before_and_insert_after_should_be_able_work_properly
    secondNode = Node.new({:datum => 1})
    @ll.insertAfter( secondNode )

    firstNode = Node.new({:datum => 0})
    @ll.insertBefore( firstNode, secondNode )    
    
    thirdNode = Node.new({:datum => 2})
    @ll.insertAfter( thirdNode, secondNode )
    
    assert_equal 3, @ll.size
    assert_equal @ll.head, firstNode
    assert_equal @ll.tail, thirdNode 
  end
  
  def test_delete_an_index_should_be_an_integer
    secondNode = Node.new({:datum => 1})
    @ll.insertAfter( secondNode )

    firstNode = Node.new({:datum => 0})
    @ll.insertBefore( firstNode, secondNode )    
    
    thirdNode = Node.new({:datum => 2})
    @ll.insertAfter( thirdNode, secondNode )
    
    assert_raise ArgumentError do
      @ll.find_at_index( "insetter" )
    end    
  end
  
  def test_find_item_at_index
    secondNode = Node.new({:datum => 1})
    @ll.insertAfter( secondNode )

    firstNode = Node.new({:datum => 0})
    @ll.insertBefore( firstNode, secondNode )    
    
    thirdNode = Node.new({:datum => 2})
    @ll.insertAfter( thirdNode, secondNode )
    
    item = @ll.find_at_index( 2 )
    
    assert_equal item, thirdNode
  end
  
  def test_delete_an_index_should_be_an_integer
    secondNode = Node.new({:datum => 1})
    @ll.insertAfter( secondNode )

    firstNode = Node.new({:datum => 0})
    @ll.insertBefore( firstNode, secondNode )    
    
    thirdNode = Node.new({:datum => 2})
    @ll.insertAfter( thirdNode, secondNode )
    
    assert_raise ArgumentError do
      @ll.delete_at( "insetter" )
    end    
  end
  
  def test_delete_an_index_should_delete_an_item_at_the_index
    secondNode = Node.new({:datum => 1})
    @ll.insertAfter( secondNode )

    firstNode = Node.new({:datum => 0})
    @ll.insertBefore( firstNode, secondNode )    
    
    thirdNode = Node.new({:datum => 2})
    @ll.insertAfter( thirdNode, secondNode ) 
    
    @ll.delete_at( 1 )
    
    assert_equal 2, @ll.size
    assert_equal "0-->2", @ll.to_s
  end
end
