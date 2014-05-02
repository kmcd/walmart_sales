require 'rake'
require 'rake/testtask'
require 'yaml'
 
task :default => [:test]

task :import do
  db = 'walmart_sales'
  `dropdb #{db}`
  `createdb #{db}`
  require 'active_record'
  ActiveRecord::Base.establish_connection adapter:'postgresql',
    database:'walmart_sales', host:'localhost'
  load 'db/schema.rb'
  
  `psql #{db} < db/import.sql`
end

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end


task :blend => :test do                                                     
  puts 'Blending'
end

task :partition do
  require_relative 'lib/walmart_sales'
  examples, number_of_partitions = Train.count, 5
  partitions = (1..examples).
    to_a.
    shuffle.
    each_slice(examples/number_of_partitions).
    map {|_| _ }
  
  Partition.create name:'disposable',       training_ids:partitions.first.to_s
  Partition.create name:'train_1',          training_ids:partitions[1].to_s
  Partition.create name:'train_2',          training_ids:partitions[2].to_s
  Partition.create name:'train_3',          training_ids:partitions[3].to_s
  Partition.create name:'cross_validation', training_ids:partitions.last.to_s
end