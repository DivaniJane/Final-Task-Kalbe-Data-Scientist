--query 1 : Rata-rata umur customer jika dilihat dari marital statusnya 
select case
	when "Marital Status" = '' then 'Other'
	else "Marital Status" end
"Marital Status",
avg(age) as avg_age from customer
group by "Marital Status";

--query 2 : Rata-rata umur customer jika dilihat dari gender
SELECT
    CASE
        WHEN gender = 0 THEN 'Wanita'
        WHEN gender = 1 THEN 'Pria'
    END  gender,
    AVG(age) AS Rata_rata_Umur
FROM customer
GROUP BY gender;

--query 3 : Nama store dengan total quantity terbanyak!
select s.storename,
sum(t.qty) as sum_qty from store as s
inner join "Transaction" as t
on s.storeid = t.storeid
group by s.storeid, s.storename
order by sum_qty desc
limit 1;


--query 4: : Nama produk terlaris dengan total amount terbanyak!
select p."Product Name",
sum(t.totalamount) as sum_totalamount from product as p
inner join "Transaction" as t
on p.productid = t.productid
group by p.productid, p."Product Name"
order by sum_totalamount desc
limit 1;
