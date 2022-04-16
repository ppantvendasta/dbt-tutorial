{{config(materialized='view')}}
SELECT
    *
FROM
    `revops-vendasta.demand_gen.opportunity_closes`