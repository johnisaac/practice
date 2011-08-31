class Integer
  def up_to
    to = self.to_i
    (0..to).each{|x| yield(x) }
  end
end