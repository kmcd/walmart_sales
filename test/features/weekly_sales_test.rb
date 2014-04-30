require 'helper'

class WeeklySalesTest < Test::Unit::TestCase
  test "fetch weekly sales total for department" do
    assert_equal 24924.5, WeeklySales.new(store:1,dept:1, date:'2010-02-05').total
  end
end