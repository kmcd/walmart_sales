copy features
from '/Users/kmcd/src/walmart_sales/data/features.csv'
with csv header
NULL AS 'NA';

copy train
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