class Feature < ActiveRecord::Base
  attr_reader :store, :dept, :date
  
  def initialize(store:1, dept:1, date:nil)
    @store, @dept, @date = store, dept, date
  end
  
  def sales
    db[:train].
      where(store:store, dept:dept, date:date).
      select(:weekly_sales).
      first[:weekly_sales].to_f
  end
  
  private
  
  def db
    @db ||= DB
  end
end