partition = Partition.first.training_ids
examples = Train.where id:partition # store:1, dept:1, 
features = examples.map {|e| Feature.where(store:e.store, week:e.week).first }

feature_data = -> (_) {
  [
    _.week.cweek,
    _.temperature,
    _.fuel_price,
    _.markdown1 || 0,
    _.markdown2 || 0,
    _.markdown3 || 0,
    _.markdown4 || 0,
    _.markdown5 || 0,
    _.cpi,
    _.unemployment,
    _.isholiday ? 1 : 0
  ]
}

inputs = features.map {|_| feature_data.call(_).map &:to_f }
outputs = examples.map {|_| [ _.weekly_sales.to_f ] }
train = RubyFann::TrainData.new inputs:inputs, desired_outputs:outputs
fann = RubyFann::Shortcut.new num_inputs:inputs.size, num_outputs:1
  
# 1000 max_epochs, 10 errors between reports and 0.1 desired MSE (mean-squared-error)
fann.cascadetrain_on_data train, 7, 10, 0.1
test = [ Feature.last ].map {|_| feature_data.call(_).map &:to_f }.first
outputs = fann.run test
