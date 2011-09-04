require '../lib/common.rb'
require '../array/array.rb'
require '../node/node.rb'

class LinkedList
  
  attr_accessor :head, :current, :size, :tail
  
  def initialize
    @head = nil
    @current = nil
    @size = 0
    @tail = nil
  end
  
  def insertBefore( newNode, beforeNode = nil )
    raise TypeError, "LinkedList's elements can be only of Node type" if ( self.size > 0 && beforeNode.class != Node )|| newNode.class != Node
    raise ArgumentError, "LinkedList's data cannot be nil" if ( self.size > 0 && beforeNode.datum.nil? ) || newNode.datum.nil?

    case self.size
    when 0
      self.head = newNode
      self.size += 1
      self.current = self.head
      self.tail = self.head
    when 1
      newNode.ref = self.head
      self.head.prev = newNode
      self.head = newNode
      self.size += 1
      self.current = self.head
      self.tail = beforeNode  
    else
      # save the beforeNode as the afterNode
      # check if the beforeNode is the head,
      # if it is the head, then
      # =>  newNode as the head
      # =>  newNode.ref as the beforeNode
      # =>  newNode.prev as nil
      # =>  beforeNode.prev as the newNode
      # else
      # =>  newPrev as beforeNode.prev
      # =>  afterNode = beforeNode
      # =>  newNode.ref as afterNode
      # =>  newNode.prev as newPrev
      # =>  newPrev.ref = newNoe
      # =>  afterNode.prev = newNode
      # =>  
      
      afterNode = beforeNode

      if afterNode == @head
        newNode.ref = afterNode
        newNode.prev = nil
        afterNode.prev = newNode
        @head = newNode
      else
        newPrev = beforeNode.prev
        afterNode = beforeNode
        newNode.ref = afterNode
        newNode.prev = newPrev
        newPrev.ref = newNode
        afterNode.prev = newNode
      end
      @current = newNode
      @size +=1
    end
  end
  
  def insertAfter( newNode, afterNode = nil )
    raise TypeError, "LinkedList's elements can be only of Node type" if ( self.size > 0 && afterNode.class != Node )|| newNode.class != Node
    raise ArgumentError, "LinkedList's data cannot be nil" if ( self.size > 0 && afterNode.datum.nil? ) || newNode.datum.nil?

    case self.size
    when 0
      self.head = newNode
      self.size += 1
      self.current = self.head
      self.tail = self.head
    when 1
      afterNode.ref = newNode
      newNode.prev = afterNode
      newNode.ref = nil
      @head = afterNode
      @size += 1
      @current = newNode
      @tail = newNode
    when 2
      if afterNode == @tail
        afterNode.ref = newNode
        newNode.prev = afterNode
        newNode.ref = nil
        @tail = newNode
        @size += 1
        @current = newNode
      else
        afNode = afterNode.ref
        newNode.prev = afterNode
        newNode.ref = afNode
        afNode.prev = newNode
        afterNode.ref  = newNode
        @size += 1 
        @current = newNode
      end
    end
  end
  
  def to_s
    total = []
    each do|node|
      total << node.datum
    end
    total.join("-->")
  end
  
  def each
    current = self.head
    while !current.nil?
      yield current
      current = current.ref
    end
  end
  
  def find_at_index( index )
    return nil if index > @size
    raise ArgumentError, "Invalid Index Number" unless index.class == Fixnum or Integer
    
    target = nil
    i = 0
    each do|item|
      if i == index
        target = item
        break
      end
      i += 1
    end
    
    target
  end
  
  def delete_at( index )
    return nil if index > @size
    raise ArgumentError, "Invalid Index Number" unless index.class == Fixnum or Integer
    
    targetItem = find_at_index( index )
    prevItem = targetItem.prev
    nextItem = targetItem.ref
    
    prevItem.ref = nextItem
    nextItem.prev = prevItem
    
    targetItem.ref = nil
    targetItem.prev = nil
    
    @size -= 1
  end
  
  def previous
    @current.prev
  end
  
  def next
    @current.ref
  end
  
end