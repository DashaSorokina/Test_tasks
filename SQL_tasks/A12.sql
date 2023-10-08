--А) какую сумму в среднем в месяц тратит:
-- пользователи в возрастном диапазоне от 18 до 25 лет включительно
-- соединим все таблицы и отберем нужные по возрасту строки.
-- сгруппируем сумму трат по месяцу и году. 
-- посчитаем средннее в месяц для каждого года. (если в году были продажи только в двух месяцах, то среднее считаем, как (s1+s2)/2)
SELECT 
	years, 
	ROUND(AVG(sum_by_month::numeric), 2) as average_monthly_spending
FROM (
	SELECT  EXTRACT(YEAR FROM purchase_date) as years, 
	  EXTRACT(MONTH FROM purchase_date) AS month_num,
	  SUM(price) as sum_by_month
    FROM purchases 
		LEFT OUTER JOIN users ON purchases.userid = users.userid
		LEFT OUTER JOIN items ON purchases.itemid = items.itemid
	WHERE age BETWEEN 18 AND 25
	GROUP BY EXTRACT(MONTH FROM purchase_date), EXTRACT(YEAR FROM purchase_date)) as foo
GROUP BY years

-- пользователи в возрастном диапазоне от 26 до 35 лет включительно
SELECT 
	years, 
	ROUND(AVG(sum_by_month::numeric), 2) as average_monthly_spending
FROM (
	SELECT  EXTRACT(YEAR FROM purchase_date) as years, 
	  EXTRACT(MONTH FROM purchase_date) AS month_num,
	  SUM(price) as sum_by_month
    FROM purchases 
		LEFT OUTER JOIN users ON purchases.userid = users.userid
		LEFT OUTER JOIN items ON purchases.itemid = items.itemid
	WHERE age BETWEEN 26 AND 35
	GROUP BY EXTRACT(MONTH FROM purchase_date), EXTRACT(YEAR FROM purchase_date)) as foo
GROUP BY years
