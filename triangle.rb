module Triangle

  class Triangle
    def initialize(x,y,z)
      @sides = [x,y,z].sort
    end

    def is_valid
      does_not_have_a_zero_length_side && 
      does_not_have_one_side_larger_than_sum_of_others
    end

    private

    def does_not_have_a_zero_length_side
      @sides[0] * @sides[1] * @sides[2] > 0
    end

    def does_not_have_one_side_larger_than_sum_of_others
      @sides[1] + @sides[0] >= @sides[2]
    end
  end

  describe "triangle" do
    it "is not a triangle if one side is zero" do
      triangle = Triangle.new(0,1,1)
      triangle.is_valid.should eql(false)
    end

    it "is a triangle if all sides are equal" do
      triangle = Triangle.new(1,1,1)
      triangle.is_valid.should eql(true)
    end

    it "is not a triangle if one side larger than sum of other two" do
      triangle = Triangle.new(5,1,1)
      triangle.is_valid.should eql(false)
    end
  end

end
