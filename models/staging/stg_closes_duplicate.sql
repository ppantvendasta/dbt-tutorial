{{config(materialized='view')}}
SELECT
    *
FROM
    `revops-vendasta.demand_gen.closed_won_pv`