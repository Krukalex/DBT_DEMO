WITH BIKE AS (
    SELECT 
        RIDE_ID,
        REPLACE(STARTED_AT, '"', '') AS STARTED_AT,
        REPLACE(ENDED_AT, '"', '') AS ENDED_AT,
        START_STATION_NAME,
        START_STATIO_ID,
        END_STATION_NAME,
        END_STATION_ID,
        START_LAT,
        START_LNG,
        END_LAT,
        END_LNG,
        MEMBER_CSUAL
    FROM 
        {{ source('demo', 'bike') }}
    WHERE
        ride_id != 'bikeid' and 
        STARTED_AT not like '%starttime%' and 
        ENDED_AT not like '%stoptime%'
)
select
    *
from 
    bike