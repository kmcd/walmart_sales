require 'rake'
require 'rake/testtask'

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