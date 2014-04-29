models = %i[ knn, linear ]
Feature.all
# -> year_on_year_monthly_sales, year_on_year_cpi

# All combinations ->
Learner.new model: :knn,
  data_x: :year_on_year_monthly,
  data_y: :year_on_year_cpi
  
Learner.new model: :knn,
  data_x: :previous_sales_standard_deviation,
  data_y: :unemployment_rate

Feature.data :year_on_year_monthly
# => [ 2012-12-12 ]

feature :year_on_year_monthly do
  # set_time
  select(:foo).group_by :bar
end

feature :cpi_monthly_increase do
  # set_time
  select(:foo).group_by :bar
end