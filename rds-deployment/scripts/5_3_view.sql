

create view staging.vw_income_statement as
--- view to insert cleaned data into dbo.income_statement
select 
    cast(date as date) as date,
    cast(tax_effect_of_unusual_items as float) as tax_effect_of_unusual_items,
    cast(tax_rate_for_calcs as float) as tax_rate_for_calcs,
    cast(normalized_ebitda as float) as normalized_ebitda,
    cast(total_unusual_items as float) as total_unusual_items,
    cast(total_unusual_items_excluding_goodwill as float) as total_unusual_items_excluding_goodwill,
    cast(net_income_from_continuing_operation_net_minority_interest as float) as net_income_from_continuing_operation_net_minority_interest,
    cast(reconciled_depreciation as float) as reconciled_depreciation,
    cast(reconciled_cost_of_revenue as float) as reconciled_cost_of_revenue,
    cast(ebitda as float) as ebitda,
    cast(ebit as float) as ebit,
    cast(net_interest_income as float) as net_interest_income,
    cast(interest_expense as float) as interest_expense,
    cast(interest_income as float) as interest_income,
    cast(normalized_income as float) as normalized_income,
    cast(net_income_from_continuing_and_discontinued_operation as float) as net_income_from_continuing_and_discontinued_operation,
    isnull(cast(total_expenses as float), cast(isnull(total_revenue, ism.avg_total_revenue) as float) * ism.avg_expense_revenue_ratio) as total_expenses,  -- replace null with industry average
    cast(rent_expense_supplemental as float) as rent_expense_supplemental,
    cast(diluted_average_shares as float) as diluted_average_shares,
    cast(basic_average_shares as float) as basic_average_shares,
    cast(diluted_eps as float) as diluted_eps,
    cast(isnull(basic_eps, ism.avg_eps) as float) as basic_eps,
    cast(diluted_ni_availto_com_stockholders as float) as diluted_ni_availto_com_stockholders,
    cast(net_income_common_stockholders as float) as net_income_common_stockholders,
    cast(otherunder_preferred_stock_dividend as float) as otherunder_preferred_stock_dividend,
    isnull(cast(net_income as float), cast(isnull(total_revenue, ism.avg_total_revenue) as float) - isnull(cast(total_expenses as float), cast(isnull(total_revenue, ism.avg_total_revenue) as float) * ism.avg_expense_revenue_ratio)) as net_income, -- replace null with industry average
    cast(net_income_including_noncontrolling_interests as float) as net_income_including_noncontrolling_interests,
    cast(net_income_discontinuous_operations as float) as net_income_discontinuous_operations,
    cast(net_income_continuous_operations as float) as net_income_continuous_operations,
    cast(tax_provision as float) as tax_provision,
    cast(pretax_income as float) as pretax_income,
    cast(other_non_operating_income_expenses as float) as other_non_operating_income_expenses,
    cast(special_income_charges as float) as special_income_charges,
    cast(other_special_charges as float) as other_special_charges,
    cast(write_off as float) as write_off,
    cast(net_non_operating_interest_income_expense as float) as net_non_operating_interest_income_expense,
    cast(total_other_finance_cost as float) as total_other_finance_cost,
    cast(interest_expense_non_operating as float) as interest_expense_non_operating,
    cast(interest_income_non_operating as float) as interest_income_non_operating,
    cast(operating_income as float) as operating_income,
    cast(operating_expense as float) as operating_expense,
    cast(other_operating_expenses as float) as other_operating_expenses,
    cast(depreciation_and_amortization_in_income_statement as float) as depreciation_and_amortization_in_income_statement,
    cast(amortization as float) as amortization,
    cast(depreciation_income_statement as float) as depreciation_income_statement,
    cast(selling_general_and_administration as float) as selling_general_and_administration,
    cast(selling_and_marketing_expense as float) as selling_and_marketing_expense,
    cast(general_and_administrative_expense as float) as general_and_administrative_expense,
    cast(rent_and_landing_fees as float) as rent_and_landing_fees,
    isnull(cast(gross_profit as float), cast(isnull(total_revenue, ism.avg_total_revenue) as float) * ism.avg_profit_revenue_ratio) as gross_profit,  -- replace null with industry average
    cast(cost_of_revenue as float) as cost_of_revenue,
    cast(isnull(total_revenue, ism.avg_total_revenue) as float) as total_revenue,
    cast(operating_revenue as float) as operating_revenue,
    cast(minority_interests as float) as minority_interests,
    cast(research_and_development as float) as research_and_development,
    cast(impairment_of_capital_assets as float) as impairment_of_capital_assets,
    cast(gain_on_sale_of_security as float) as gain_on_sale_of_security,
    cast(insurance_and_claims as float) as insurance_and_claims,
    cast(restructuring_and_mergern_acquisition as float) as restructuring_and_mergern_acquisition,
    cast(net_income_extraordinary as float) as net_income_extraordinary,
    cast(total_operating_income_as_reported as float) as total_operating_income_as_reported,
    cast(other_income_expense as float) as other_income_expense,
    cast(gain_on_sale_of_ppe as float) as gain_on_sale_of_ppe,
    cast(earnings_from_equity_interest as float) as earnings_from_equity_interest,
    cast(average_dilution_earnings as float) as average_dilution_earnings,
    cast(preferred_stock_dividends as float) as preferred_stock_dividends,
    cast(depreciation_amortization_depletion_income_statement as float) as depreciation_amortization_depletion_income_statement,
    cast(amortization_of_intangibles_income_statement as float) as amortization_of_intangibles_income_statement,
    cast(other_gand_a as float) as other_gand_a,
    cast(salaries_and_wages as float) as salaries_and_wages,
    cast(occupancy_and_equipment as float) as occupancy_and_equipment,
    cast(other_non_interest_expense as float) as other_non_interest_expense,
    cast(gain_on_sale_of_business as float) as gain_on_sale_of_business,
    cast(other_taxes as float) as other_taxes,
    cast(net_policyholder_benefits_and_claims as float) as net_policyholder_benefits_and_claims,
    cast(earnings_from_equity_interest_net_of_tax as float) as earnings_from_equity_interest_net_of_tax,
    cast(provision_for_doubtful_accounts as float) as provision_for_doubtful_accounts,
    cast(professional_expense_and_contract_services_expense as float) as professional_expense_and_contract_services_expense,
    cast(replace(ist.security_id, '.BO', '') as varchar(25)) as security_id,
    cast(cast(ist.security_code as float) as int) as security_code
from staging.income_statement ist
left join staging.vw_industry_income_to_security_map ism
    on ism.security_id = ist.security_id
    and ism.security_code = ist.security_code
inner join financial_analytics.dbo.securities s
    on s.security_code = ist.security_code
    and s.security_id = replace(ist.security_id, '.BO', '');