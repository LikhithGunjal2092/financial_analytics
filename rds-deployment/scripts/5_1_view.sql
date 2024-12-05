
create view staging.vw_income_statement_agg as
with cte_financials as (
    select 
        ind.ind_code,
        year(i.date) as year,
        avg(cast(total_revenue as float)) as avg_total_revenue,
		avg(cast(basic_eps as float)) as avg_basic_eps,
		case when avg(cast(gross_profit as float)/cast(isnull(replace(total_revenue,'0','1'),'1') as float)) between 0 and 1 then avg(cast(gross_profit as float)/cast(isnull(replace(total_revenue,'0','1'),'1') as float)) else null end as avg_profit_revenue_ratio,
		case when avg(cast(total_expenses as float)/cast(isnull(replace(total_revenue,'0','1'),'1') as float)) between 0 and 1 then avg(cast(total_expenses as float)/cast(isnull(replace(total_revenue,'0','1'),'1') as float)) else null end as avg_expense_revenue_ratio
    from financial_analytics.staging.income_statement i
    inner join dbo.securities s
        on s.security_id = replace(i.security_id, '.bo', '')
        and s.security_code = i.security_code
    inner join dbo.basic_industry bi
        on bi.basic_industry_search_optimized = s.isubgroup_name_search_optimized
    inner join dbo.industry ind
        on ind.ind_code = bi.ind_code
    group by ind.ind_code, year(i.date)
)
select 
    ind_code,
    year,
    isnull(avg_total_revenue, 
           coalesce(
               1.05*lag(avg_total_revenue) over (partition by ind_code order by year),
               0.95*lead(avg_total_revenue) over (partition by ind_code  order by year)
           )) as avg_total_revenue,

	isnull(avg_basic_eps, 
           coalesce(
               1.05*lag(avg_basic_eps) over (partition by ind_code  order by year), -- adding 5% increment if missing
               0.95*lead(avg_basic_eps) over (partition by ind_code  order by year) -- adding 5% decrement if missing
           )) as avg_eps,

	isnull(avg_profit_revenue_ratio, 
           coalesce(
               1.05*lag(avg_profit_revenue_ratio) over (partition by ind_code  order by year), -- adding 5% increment if missing
               0.95*lead(avg_profit_revenue_ratio) over (partition by ind_code  order by year) -- adding 5% decrement if missing
           )) as avg_profit_revenue_ratio,

	isnull(avg_expense_revenue_ratio, 
           coalesce(
               1.05*lag(avg_expense_revenue_ratio) over (partition by ind_code  order by year), -- adding 5% increment if missing
               0.95*lead(avg_expense_revenue_ratio) over (partition by ind_code  order by year) -- adding 5% decrement if missing
           )) as avg_expense_revenue_ratio
from cte_financials;