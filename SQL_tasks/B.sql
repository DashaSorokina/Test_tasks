-- Б) в каком месяце года выручка от пользователей в возрастном диапазоне 35+ самая большая
-- Отберем записи где возраст больше 35
-- Для каждого года, каждого месяца в году посчитаем сумму выручки
-- Отсортируем записи по году(по возрастанию) и выручку по убыванию цены для каждого года
-- Вернем по одной записи по каждому году (год, месяц, выручка)
SELECT
    DISTINCT ON (years)
    years,
    month_num,
    sum_by_month
FROM (
    SELECT
        EXTRACT(YEAR FROM purchase_date) as years,
        EXTRACT(MONTH FROM purchase_date) AS month_num,
        SUM(price) as sum_by_month
    FROM
        purchases 
        LEFT OUTER JOIN users ON purchases.userid = users.userid
        LEFT OUTER JOIN items ON purchases.itemid = items.itemid
    WHERE
        age >= 35
    GROUP BY
        EXTRACT(YEAR FROM purchase_date),
        EXTRACT(MONTH FROM purchase_date)
) as foo
ORDER BY
    years,
    sum_by_month DESC;