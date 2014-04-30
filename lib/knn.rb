class KNN
  attr_reader :examples, :neighbours
  
  def initialize(examples=[], neighbours=4)
    @examples, @neighbours = examples.clone, neighbours
  end
  
  def sales
  end
  
  private
  
  def euclidean_distance(trades, example)
    trades.zip(example).
      map {|p1,p2| (p1 - p2) ** 2 }.compact.
      reduce(:+) ** 0.5
  end
  
  def gaussian_weight(distance,sigma=10.0)
    Math::E ** ( -distance**2 / ( 2 * sigma**2 ) )
  end
  
  def inverse_weight(distance)
    (1.0 / ( distance + 0.1 )) / 10
  end
end