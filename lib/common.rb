module Common
  def count
    @elements.count
  end
  
  def push( item )
    @elements << item
  end
  
  alias :length :count
end