WITH CTE AS (
    SELECT
        t.*,
        w.*
    FROM
        {{ ref('trip_fact') }} t
        LEFT JOIN {{ ref('daily_weather') }} w
        ON t.trip_date = w.daily_weather
    ORDER BY 
        t.trip_date desc
    LIMIT 10
)
SELECT
    *
FROM
    CTE