require 'rake'

task :default => [:test]

task :blend => :test do
  puts 'Blending'
end

task :feature, [:name] do |t, args|
  # Take feature name from standard in
  puts args[:name]
  # Generate lib, test files from template
end

task :test do
  puts 'Running tests'
end

task :import do
  db = 'walmart_sales'
  `dropdb #{db}`
  `createdb #{db}`
  `psql #{db} < db/schema.sql`
  `psql #{db} < db/import.sql`
end