---
layout: post
title: "rolling agony with SQL"
date: 2019-07-17 10:49:12 -0500
comments: false
categories:
---

Recently, I got into a mountain biking accident and broke myself. Like most really bad server crashes, I had to be surgically repaired. Living in the USA, part of the medical process is getting financially blindsided by a bunch of bills you can not understand or nor likely afford.  
  
While on medication, I thought it might be a good idea to try to calculate which day might have the most emotional anguish to compliment the physical anguish. My theory is that the longest consecutive day with a negative balance on my bills would be prime time stress.  
  
Out dataset:
```
CREATE TABLE agony (id serial primary key, transaction_date date, amount int);

INSERT INTO  agony (transaction_date, amount)
VALUES ('2019-07-01', 500), ('2019-07-8', -6000), 
    ('2019-07-12', 500), ('2019-07-15', 500),
    ('2019-07-21', 500), ('2019-07-22', 500),
    ('2019-07-23', 1000), ('2019-07-24', 500),
    ('2019-07-25', 4000), ('2019-07-29', -2000);
```

Baby steps first, let us look at the data from the month level:
```
SELECT date_trunc('MONTH', transaction_date), sum(amount)
FROM agony
GROUP BY date_trunc('MONTH', transaction_date);

       date_trunc       | sum 
------------------------+-----
 2019-07-01 00:00:00-05 |   0
(1 row)
```

We broke even. Thank you fancy tech salary!  Next, we'll get our running total:

```
SELECT transaction_date, 
    amount, 
    sum(amount) over (order by transaction_date asc rows between unbounded preceding and current row) as running_total
FROM agony;


 transaction_date | amount | running_total 
------------------+--------+---------------
 2019-07-01       |    500 |           500
 2019-07-08       |  -6000 |         -5500
 2019-07-12       |    500 |         -5000
 2019-07-15       |    500 |         -4500
 2019-07-21       |    500 |         -4000
 2019-07-22       |    500 |         -3500
 2019-07-23       |   1000 |         -2500
 2019-07-24       |    500 |         -2000
 2019-07-25       |   4000 |          2000
 2019-07-29       |  -2000 |             0
(10 rows)
```

The road to recovery from accident like mine requires many days... lets add more days with our running total:
```
SELECT date(gen_date), COALESCE(a.amount, 0) as transaction_amount
    , sum(COALESCE(a.amount, 0)) over (order by gen_date asc rows between unbounded preceding and current row) as running_total
FROM generate_series('2019-07-01'::date, '2019-07-31'::date, '1 day') as gen_date
    LEFT OUTER JOIN agony a on gen_date = a.transaction_date
GROUP BY gen_date, a.amount
ORDER BY gen_date;


    date    | transaction_amount | running_total 
------------+--------------------+---------------
 2019-07-01 |                500 |           500
 2019-07-02 |                  0 |           500
 2019-07-03 |                  0 |           500
 2019-07-04 |                  0 |           500
 2019-07-05 |                  0 |           500
 2019-07-06 |                  0 |           500
 2019-07-07 |                  0 |           500
 2019-07-08 |              -6000 |         -5500
 2019-07-09 |                  0 |         -5500
 2019-07-10 |                  0 |         -5500
 2019-07-11 |                  0 |         -5500
 2019-07-12 |                500 |         -5000
 2019-07-13 |                  0 |         -5000
 2019-07-14 |                  0 |         -5000
 2019-07-15 |                500 |         -4500

 yada yada yada, it goes to the end of the month
```

That was a pretty fun window function. In fact, there is only one thing I can think of that would out RANK() that function:

```
WITH pure_agony as (
    SELECT date(gen_date), COALESCE(a.amount, 0) as transaction_amount
        , sum(COALESCE(a.amount, 0))    
            over (order by gen_date asc rows between unbounded preceding and current row) as running_total
    FROM generate_series('2019-07-01'::date, '2019-07-31'::date, '1 day') as gen_date
        LEFT OUTER JOIN agony a on gen_date = a.transaction_date
    group by gen_date, a.amount
)
SELECT date, transaction_amount, running_total
    , CASE WHEN running_total < 0 THEN rank() OVER (PARTITION BY CASE WHEN running_total < 0 THEN 1 ELSE 0 END ORDER BY date) ELSE 0 END as agony_index
FROM pure_agony
ORDER BY date;

   date    | transaction_amount | running_total | agony_index 
------------+--------------------+---------------+-------------
 2019-07-01 |                500 |           500 |           0
 2019-07-02 |                  0 |           500 |           0
 2019-07-03 |                  0 |           500 |           0
 2019-07-04 |                  0 |           500 |           0
 2019-07-05 |                  0 |           500 |           0
 2019-07-06 |                  0 |           500 |           0
 2019-07-07 |                  0 |           500 |           0
 2019-07-08 |              -6000 |         -5500 |           1
 2019-07-09 |                  0 |         -5500 |           2
 2019-07-10 |                  0 |         -5500 |           3
 2019-07-11 |                  0 |         -5500 |           4
 2019-07-12 |                500 |         -5000 |           5
 2019-07-13 |                  0 |         -5000 |           6
 2019-07-14 |                  0 |         -5000 |           7
 2019-07-15 |                500 |         -4500 |           8
 2019-07-16 |                  0 |         -4500 |           9
 2019-07-17 |                  0 |         -4500 |          10
 2019-07-18 |                  0 |         -4500 |          11
 2019-07-19 |                  0 |         -4500 |          12
 2019-07-20 |                  0 |         -4500 |          13
 2019-07-21 |                500 |         -4000 |          14
 2019-07-22 |                500 |         -3500 |          15
 2019-07-23 |               1000 |         -2500 |          16
 2019-07-24 |                500 |         -2000 |          17
 2019-07-25 |               4000 |          2000 |           0
 2019-07-26 |                  0 |          2000 |           0
 2019-07-27 |                  0 |          2000 |           0
 2019-07-28 |                  0 |          2000 |           0
 2019-07-29 |              -2000 |             0 |           0
 2019-07-30 |                  0 |             0 |           0
 2019-07-31 |                  0 |             0 |           0
```

Looks like July 24th is when I was the most emotionally distraught, but since I'm on meds, I like to think of it more as 'my soul is half full'.

