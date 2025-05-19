SELECT
    u.id AS owner_id,
    u.name,
    s.savings_count,
    p.investment_count,
    ROUND((s.total_savings + p.total_investments) / 100, 2) AS total_deposits
FROM
    adashi_staging.users_customuser u
    INNER JOIN (
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
    ) s ON u.id = s.owner_id
    INNER JOIN (
        SELECT
            owner_id,
            COUNT(*) AS investment_count,
            SUM(amount) AS total_investments
        FROM
            adashi_staging.plans_plan
        WHERE
            is_a_fund = 1
            AND amount > 0
        GROUP BY
            owner_id
    ) p ON u.id = p.owner_id
ORDER BY
    total_deposits asc;
