
update dbo.securities set isubgroup_name_search_optimized =  lower(dbo.udf_extractalphabets(isubgroup_name));

update dbo.securities set isubgroup_name_search_optimized =  null where isubgroup_name_search_optimized = '';

create nonclustered index ix_securities_isubgroup on dbo.securities(isubgroup_name_search_optimized);

update dbo.basic_industry set basic_industry_search_optimized =  lower(dbo.udf_extractalphabets(basic_industry_definition));

create nonclustered index ix_basic_industry_search_optimized on dbo.basic_industry(basic_industry_search_optimized);