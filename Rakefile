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

# TODO: create in db instead - this doesn't belong in source repo
task :partition do
  require_relative 'lib/walmart_sales'
  examples, number_of_partitions = Train.count, 5
  partitions = (1..examples).
    to_a.
    shuffle.
    each_slice(examples/number_of_partitions).
    map {|_| _ }
  
  vault = { validation: partitions.last, training:partitions[0..-2] }
  
  File.open('./data/vault.yml', 'w') {|_| _.write vault.to_yaml }
end