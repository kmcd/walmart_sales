require 'active_record'

ActiveRecord::Base.establish_connection adapter:'postgresql',
  database:'walmart_sales', host:'localhost'

require_relative 'feature'
require_relative 'knn'
require_relative 'linear'
require_relative 'learner'
require_relative 'blend'

Dir.entries( File.join( File.dirname(__FILE__), 'features' ) ).
  grep(/\.rb$/).
  each {|_| require_relative "features/" + _.gsub(/\.rb/, '') }