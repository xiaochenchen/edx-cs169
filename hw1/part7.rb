class CartesianProduct

  include Enumerable

  # YOUR CODE HERE
  attr_accessor :l_enum, :r_enum

  def initialize(l_enum, r_enum)
    @l_enum = l_enum
    @r_enum = r_enum
  end

  def each
    self.l_enum.each {
        |l| self.r_enum.each {
          |r| yield [l, r]
      }
    }
  end

end
