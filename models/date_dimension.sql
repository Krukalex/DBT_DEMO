WITH CTE AS (
    SELECT
        to_timestamp(started_at) as started_at,
        date(to_timestamp(started_at)) as date_started_at,
        hour(to_timestamp(started_at)) as hour_started_at,
        {{day_type('started_at')}} AS DAY_TYPE,
        {{get_season('started_at')}} as STATION_OF_YEAR
    FROM 
        {{ source('demo', 'bike') }}
    WHERE 
        STARTED_AT != 'started_at'
)
SELECT * FROM CTE