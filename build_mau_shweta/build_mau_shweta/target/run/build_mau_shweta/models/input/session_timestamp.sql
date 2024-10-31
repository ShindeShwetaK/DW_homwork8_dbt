
  create or replace   view dev.analytics.session_timestamp
  
   as (
    with session_data as (
    SELECT
        sessionId,
        ts
    FROM dev.raw_data.session_timestamp
    WHERE sessionId IS NOT NULL
)

select * from session_data
  );

