WITH  __dbt__cte__user_session_channel as (
with user_data as (
    SELECT
        userId,
        sessionId,
        channel
    FROM dev.raw_data.user_session_channel
    WHERE sessionId IS NOT NULL
)

select * from user_data
),  __dbt__cte__session_timestamp as (
with session_data as (
    SELECT
        sessionId,
        ts
    FROM dev.raw_data.session_timestamp
    WHERE sessionId IS NOT NULL
)

select * from session_data
), u AS (
SELECT * FROM __dbt__cte__user_session_channel
), st AS (
SELECT * FROM __dbt__cte__session_timestamp
)
SELECT u.userId, u.sessionId, u.channel, st.ts
FROM u
JOIN st ON u.sessionId = st.sessionId