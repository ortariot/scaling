create table avg_temp (
  city_id uuid not null,
  logdate date not null,
  avg_temp float
) partition by range (logdate);

create table avg_temp_jan24
partition of avg_temp
for values from ('2024-01-01') to ('2024-02-01');

create table avg_temp_feb24
partition of avg_temp
for values from ('2024-02-01') to ('2024-02-28');

create table avg_temp_mar24
partition of avg_temp
for values from ('2024-02-28') to ('2024-04-30');

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

insert into avg_temp (city_id, logdate, avg_temp)
values (uuid_generate_v4(), '2024-01-03', 1)

insert into avg_temp (city_id, logdate, avg_temp)
values (
	uuid_generate_v4(),
	generate_series( '2024-01-01'::date, '2024-02-28'::date, '1 day' ),
	1
);
