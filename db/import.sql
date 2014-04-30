copy features(store,week,temperature,fuel_price,markdown1,markdown2,markdown3,markdown4,markdown5,cpi,unemployment,isholiday )
from '/Users/kmcd/src/walmart_sales/data/features.csv'
with csv header
NULL AS 'NA';

copy train(store, dept, week, weekly_sales, isholiday)
from '/Users/kmcd/src/walmart_sales/data/train.csv'
with csv header
NULL AS 'NA';

copy test(store,dept,week,isholiday)
from '/Users/kmcd/src/walmart_sales/data/test.csv'
with csv header
NULL AS 'NA';

copy stores(store,type,size)
from '/Users/kmcd/src/walmart_sales/data/stores.csv'
with csv header
NULL AS 'NA';