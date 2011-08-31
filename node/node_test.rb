require './node.rb'
require 'test/unit'

class NodeTest < Test::Unit::TestCase
  def setup
    @node = Node.new
  end
  
  def test_an_object_of_queue_is_created
    assert_equal @node.class, Node
  end
end