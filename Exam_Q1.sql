SELECT
    owner_id,
    COUNT(*) AS savings_count,
    SUM(confirmed_amount) AS total_savings
FROM
    adashi_staging.savings_savingsaccount
WHERE
    confirmed_amount > 0
GROUP BY
    owner_id
