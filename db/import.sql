copy features(store,date,temperature,fuel_price,markdown1,markdown2,markdown3,markdown4,markdown5,cpi,unemployment,isholiday )
from '/Users/kmcd/src/walmart_sales/data/features.csv'
with csv header
NULL AS 'NA';

copy train(store, dept, date, weekly_sales, isholiday)
from '/Users/kmcd/src/walmart_sales/data/train.csv'
with csv header
NULL AS 'NA';

copy test
from '/Users/kmcd/src/walmart_sales/data/test.csv'
with csv header
NULL AS 'NA';

copy stores
from '/Users/kmcd/src/walmart_sales/data/stores.csv'
with csv header
NULL AS 'NA';