create table features(
  store integer,
  date date,
  temperature decimal,
  fuel_price decimal,
  markdown1 decimal,
  markdown2 decimal,
  markdown3 decimal,
  markdown4 decimal,
  markdown5 decimal,
  cpi decimal,
  unemployment decimal,
  isholiday boolean
);
  
create table train(
  store integer,
  dept integer,
  date date,
  weekly_sales decimal,
  isholiday boolean
);
  
create table test(
  store integer,
  dept integer,
  date date,
  isholiday boolean
);

create table stores(
  store integer,
  type varchar(1),
  size integer
);