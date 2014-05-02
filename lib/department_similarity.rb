class DepartmentSimilarity
  def initialize
    @departments = 
  end
  
  def table
    training.map do |_|
      key = [ _.store, _.dept ].join '-'
      [ euclidean_distance(_), key ]
    end.sort_by &:first
  end
  
  def euclidean_distance(department)
    training.
      map {|_| (_.weekly_sales - department.weekly_sales) ** 2 }.
      compact.
      reduce(:+) ** 0.5
  end
end
