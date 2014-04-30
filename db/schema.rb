ActiveRecord::Schema.define(version: 1) do
  enable_extension 'plpgsql'
  enable_extension 'hstore'

  create_table 'features', force: true do |t|
    t.integer  'store'
    t.date 'week'
    t.decimal  'temperature'
    t.decimal  'fuel_price'
    t.decimal  'markdown1'
    t.decimal  'markdown2'
    t.decimal  'markdown3'
    t.decimal  'markdown4'
    t.decimal  'markdown5'
    t.decimal  'cpi'
    t.decimal  'unemployment'
    t.boolean  'isholiday'
  end
  
  create_table 'train', force: true do |t|
    t.integer 'store'
    t.integer 'dept'
    t.date    'week'
    t.decimal 'weekly_sales'
    t.boolean 'isholiday'
  end
  
  create_table 'test', force: true do |t|
    t.integer 'store'
    t.integer 'dept'
    t.date    'week'
    t.boolean 'isholiday'
  end
  
  create_table 'stores', force: true do |t|
    t.integer 'store'
    t.string  'type'
    t.integer 'size'
  end
end
