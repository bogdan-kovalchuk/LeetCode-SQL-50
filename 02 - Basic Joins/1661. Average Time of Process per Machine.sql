SELECT
  machine_id,
  ROUND(AVG(end_ts - start_ts), 3) AS processing_time
FROM (
  SELECT
    machine_id,
    process_id,
    MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_ts,
    MAX(CASE WHEN activity_type = 'end'   THEN timestamp END) AS end_ts
  FROM Activity
  GROUP BY machine_id, process_id
) p
GROUP BY machine_id;