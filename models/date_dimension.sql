WITH CTE AS (
    SELECT
        to_timestamp(started_at) as started_at,
        date(to_timestamp(started_at)) as date_started_at,
        hour(to_timestamp(started_at)) as hour_started_at,
        CASE 
            WHEN DAYNAME(to_timestamp(started_at)) in ('Sat', 'Sun')
            THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
        END AS DAY_TYPE,
        CASE 
            WHEN MONTH(TO_TIMESTAMP(started_at)) in (12,1,2)
            THEN 'WINTER'
            WHEN MONTH(TO_TIMESTAMP(started_at)) in (3,4,5)
            THEN 'SPRING'
            WHEN MONTH(TO_TIMESTAMP(started_at)) in (6,7,8)
            THEN 'SUMMER'
            WHEN MONTH(TO_TIMESTAMP(started_at)) in (9,10,11)
            THEN 'AUTUMN'
        END AS STATION_OF_YEAR
    FROM 
        {{ source('demo', 'bike') }}
    WHERE 
        STARTED_AT != 'started_at'
)
SELECT * FROM CTE