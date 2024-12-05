create view staging.vw_industry_income_to_security_map as

---maps the security_id and security_code to industry avg revenue and avg eps for data imputation

	select distinct s.security_code
			,s.security_id
			,ind.ind_code
			,isa.avg_eps
			,isa.avg_total_revenue
			,isa.avg_profit_revenue_ratio
			,isa.avg_expense_revenue_ratio
    from financial_analytics.staging.income_statement i
    inner join dbo.securities s
        on s.security_id = replace(i.security_id, '.bo', '')
        and s.security_code = i.security_code
    inner join dbo.basic_industry bi
        on bi.basic_industry_search_optimized = s.isubgroup_name_search_optimized
    inner join dbo.industry ind
        on ind.ind_code = bi.ind_code
	inner join staging.vw_income_statement_agg isa
		on isa.ind_code = ind.ind_code
		and isa.year = year(i.date);

