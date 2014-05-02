class KNN
  attr_reader :examples, :neighbours
  
  def initialize(examples, neighbours=4)
    @examples, @neighbours = examples, neighbours
  end
  
  def weekly_sales(predict)
    distances(predict).
      take(neighbours).
      map(&:last).
      to_scale.mean
  end
  
  private
  
  def distances(predict)
    examples. # TODO: use a Neighbour OpenStruct
      map {|_| [ euclidean_distance(predict), _.weekly_sales ] }.
      sort_by &:first
  end
  
  def euclidean_distance(predict)
    examples.
      map {|_| (_.data - predict.data) ** 2 }.
      compact.
      reduce(:+) ** 0.5
  end
end