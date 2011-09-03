class Node
  attr_accessor :datum, :ref, :prev
  
  def initialize(args={})
    @datum = args[:datum].nil? ? nil : args[:datum]
    @ref = args[:ref].nil? ? nil : args[:ref]
    @prev = nil
  end
end