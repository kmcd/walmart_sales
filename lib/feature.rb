class Feature < ActiveRecord::Base
end

class Test < ActiveRecord::Base
  self.table_name = :test
end

class Train < ActiveRecord::Base
  self.table_name = :train
end

class Store < ActiveRecord::Base
  self.inheritance_column = :_type
end