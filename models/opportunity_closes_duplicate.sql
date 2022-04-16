{{config(materialized='view')}}
SELECT
  opps.account_group_id,
  opps.company_name,
  account_created,
  opportunity_id,
  opportunity_created_date,
  opportunity_name_at_entry,
  opportunity_status,
  opportunity_cohort,
  lead_type,
  sdr_on_opportunity,
  opps.bdr_on_opportunity,
  presentation_booked_date,
  presentation_completed_date,
  contract_date,
  pipeline_name,
  pipeline_stage_name,
  pipeline_stage_probability,
  opps.first_order_value,
  subscription_date,
  subscription,
  subscription_status,
  first_order_revenue,
  opps.inbound_outbound,
  opps.lead_program,
  opps.lead_program_description,
  opps.custom_lead_source,
  opps.conversion_point,
  opps.custom_conversion_point,
  opps.marketing_classification,
  opps.ad_name,
  opps.tags,
  opps.enterprise_tier,
  opps.new_lead_tier,
  opps.industry,
  opps.contact_name,
  opps.contact_email,
  opps.country
FROM
  {{ref('stg_opportunity_duplicate')}} AS opps
LEFT JOIN (
  SELECT
    *
  FROM
    {{ref('stg_closes_duplicate')}}) AS closes
ON
  opps.account_group_id = closes.account_group_id
  AND closes.subscription_date >= opps.contract_date_sub_5_day
  AND closes.subscription_date <= opps.contract_date_add_5_day
ORDER BY
  subscription_date DESC