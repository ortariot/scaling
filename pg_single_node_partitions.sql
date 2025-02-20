create table avg_temp (
  city_id uuid not null,
  logdate date not null,
  avg_temp float
) partition by range (logdate);

create table avg_temp_jan25
partition of avg_temp
for values from ('2025-01-01') to ('2025-02-01');


create table avg_temp_feb25
partition of avg_temp
for values from ('2025-02-01') to ('2025-03-01');


create table avg_temp_mar25
partition of avg_temp
for values from ('2025-03-01') to ('2025-04-01');



CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

insert into avg_temp (city_id, logdate, avg_temp)
values (uuid_generate_v4(), '2025-01-04', 1);

insert into avg_temp (city_id, logdate, avg_temp)
values (uuid_generate_v4(), '2025-02-03', 1);

insert into avg_temp (city_id, logdate, avg_temp)
values (uuid_generate_v4(), '2025-03-03', 1);



select * from avg_temp;
select * from avg_temp_jan25;
select * from avg_temp_feb25;
select * from avg_temp_mar25;


insert into avg_temp (city_id, logdate, avg_temp)
values (
		uuid_generate_v4(),
		generate_series('2025-01-01'::date, '2025-03-30'::date, '1 day'),
		round(random()* 10 + random()*-20)
);



