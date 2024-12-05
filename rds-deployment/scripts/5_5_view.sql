create view staging.vw_balance_sheet 
as
select
    cast(date as date) as formatted_date,
    cast(treasury_shares_number as decimal(18, 2)) as treasury_shares_number,
    cast(ordinary_shares_number as decimal(18, 2)) as ordinary_shares_number,
    cast(share_issued as decimal(18, 2)) as share_issued,
    cast(total_debt as decimal(18, 2)) as total_debt,
    cast(tangible_book_value as decimal(18, 2)) as tangible_book_value,
    cast(invested_capital as decimal(18, 2)) as invested_capital,
    cast(working_capital as decimal(18, 2)) as working_capital,
    cast(net_tangible_assets as decimal(18, 2)) as net_tangible_assets,
    cast(capital_lease_obligations as decimal(18, 2)) as capital_lease_obligations,
    cast(common_stock_equity as decimal(18, 2)) as common_stock_equity,
    cast(total_capitalization as decimal(18, 2)) as total_capitalization,
    cast(total_equity_gross_minority_interest as decimal(18, 2)) as total_equity_gross_minority_interest,
    cast(stockholders_equity as decimal(18, 2)) as stockholders_equity,
    cast(other_equity_interest as decimal(18, 2)) as other_equity_interest,
    cast(retained_earnings as decimal(18, 2)) as retained_earnings,
    cast(additional_paid_in_capital as decimal(18, 2)) as additional_paid_in_capital,
    cast(capital_stock as decimal(18, 2)) as capital_stock,
    cast(common_stock as decimal(18, 2)) as common_stock,
    cast(total_liabilities_net_minority_interest as decimal(18, 2)) as total_liabilities_net_minority_interest,
    cast(total_non_current_liabilities_net_minority_interest as decimal(18, 2)) as total_non_current_liabilities_net_minority_interest,
    cast(derivative_product_liabilities as decimal(18, 2)) as derivative_product_liabilities,
    cast(long_term_debt_and_capital_lease_obligation as decimal(18, 2)) as long_term_debt_and_capital_lease_obligation,
    cast(long_term_capital_lease_obligation as decimal(18, 2)) as long_term_capital_lease_obligation,
    cast(long_term_debt as decimal(18, 2)) as long_term_debt,
    cast(long_term_provisions as decimal(18, 2)) as long_term_provisions,
    cast(current_liabilities as decimal(18, 2)) as current_liabilities,
    cast(other_current_liabilities as decimal(18, 2)) as other_current_liabilities,
    cast(current_deferred_taxes_liabilities as decimal(18, 2)) as current_deferred_taxes_liabilities,
    cast(current_debt_and_capital_lease_obligation as decimal(18, 2)) as current_debt_and_capital_lease_obligation,
    cast(current_capital_lease_obligation as decimal(18, 2)) as current_capital_lease_obligation,
    cast(pensionand_other_post_retirement_benefit_plans_current as decimal(18, 2)) as pension_plans_current,
    cast(current_provisions as decimal(18, 2)) as current_provisions,
    cast(payables as decimal(18, 2)) as payables,
    cast(other_payable as decimal(18, 2)) as other_payable,
    cast(dividends_payable as decimal(18, 2)) as dividends_payable,
    cast(total_tax_payable as decimal(18, 2)) as total_tax_payable,
    cast(accounts_payable as decimal(18, 2)) as accounts_payable,
    cast(total_assets as decimal(18, 2)) as total_assets,
    cast(total_non_current_assets as decimal(18, 2)) as total_non_current_assets,
    cast(other_non_current_assets as decimal(18, 2)) as other_non_current_assets,
    cast(non_current_prepaid_assets as decimal(18, 2)) as non_current_prepaid_assets,
    cast(non_current_deferred_taxes_assets as decimal(18, 2)) as non_current_deferred_taxes_assets,
    cast(financial_assets as decimal(18, 2)) as financial_assets,
    cast(other_investments as decimal(18, 2)) as other_investments,
    cast(investmentin_financial_assets as decimal(18, 2)) as investment_in_financial_assets,
    cast(held_to_maturity_securities as decimal(18, 2)) as held_to_maturity_securities,
    cast(available_for_sale_securities as decimal(18, 2)) as available_for_sale_securities,
    cast(goodwill_and_other_intangible_assets as decimal(18, 2)) as goodwill_and_other_intangible_assets,
    cast(other_intangible_assets as decimal(18, 2)) as other_intangible_assets,
    cast(goodwill as decimal(18, 2)) as goodwill,
    cast(net_ppe as decimal(18, 2)) as net_ppe,
    cast(accumulated_depreciation as decimal(18, 2)) as accumulated_depreciation,
    cast(gross_ppe as decimal(18, 2)) as gross_ppe,
    cast(construction_in_progress as decimal(18, 2)) as construction_in_progress,
    cast(other_properties as decimal(18, 2)) as other_properties,
    cast(machinery_furniture_equipment as decimal(18, 2)) as machinery_furniture_equipment,
    cast(buildings_and_improvements as decimal(18, 2)) as buildings_and_improvements,
    cast(land_and_improvements as decimal(18, 2)) as land_and_improvements,
    cast(properties as decimal(18, 2)) as properties,
    cast(current_assets as decimal(18, 2)) as current_assets,
    cast(other_current_assets as decimal(18, 2)) as other_current_assets,
    cast(hedging_assets_current as decimal(18, 2)) as hedging_assets_current,
    cast(assets_held_for_sale_current as decimal(18, 2)) as assets_held_for_sale_current,
    cast(restricted_cash as decimal(18, 2)) as restricted_cash,
    cast(prepaid_assets as decimal(18, 2)) as prepaid_assets,
    cast(inventory as decimal(18, 2)) as inventory,
    cast(finished_goods as decimal(18, 2)) as finished_goods,
    cast(work_in_process as decimal(18, 2)) as work_in_process,
    cast(raw_materials as decimal(18, 2)) as raw_materials,
    cast(other_receivables as decimal(18, 2)) as other_receivables,
    cast(taxes_receivable as decimal(18, 2)) as taxes_receivable,
    cast(accounts_receivable as decimal(18, 2)) as accounts_receivable,
    cast(allowance_for_doubtful_accounts_receivable as decimal(18, 2)) as allowance_for_doubtful_accounts_receivable,
    cast(gross_accounts_receivable as decimal(18, 2)) as gross_accounts_receivable,
    cast(cash_cash_equivalents_and_short_term_investments as decimal(18, 2)) as cash_equivalents_and_short_term_investments,
    cast(other_short_term_investments as decimal(18, 2)) as other_short_term_investments,
    cast(cash_and_cash_equivalents as decimal(18, 2)) as cash_and_cash_equivalents,
    cast(cash_equivalents as decimal(18, 2)) as cash_equivalents,
    cast(cash_financial as decimal(18, 2)) as cash_financial,
    cast(net_debt as decimal(18, 2)) as net_debt,
    cast(minority_interest as decimal(18, 2)) as minority_interest,
    cast(other_non_current_liabilities as decimal(18, 2)) as other_non_current_liabilities,
    cast(non_current_pension_and_other_postretirement_benefit_plans as decimal(18, 2)) as non_current_pension_benefits,
    cast(non_current_deferred_revenue as decimal(18, 2)) as non_current_deferred_revenue,
    cast(non_current_deferred_taxes_liabilities as decimal(18, 2)) as non_current_deferred_taxes_liabilities,
    cast(current_debt as decimal(18, 2)) as current_debt,
    cast(other_inventories as decimal(18, 2)) as other_inventories,
    cast(financial_assets_designatedas_fair_value_through_profitor_loss_total as decimal(18, 2)) as financial_assets_fair_value,
    cast(trading_securities as decimal(18, 2)) as trading_securities,
    cast(long_term_equity_investment as decimal(18, 2)) as long_term_equity_investment,
    cast(investmentsin_joint_venturesat_cost as decimal(18, 2)) as investments_in_joint_ventures_cost,
    cast(investmentsin_associatesat_cost as decimal(18, 2)) as investments_in_associates_cost,
    cast(preferred_securities_outside_stock_equity as decimal(18, 2)) as preferred_securities_outside_equity,
    cast(tradeand_other_payables_non_current as decimal(18, 2)) as trade_and_other_payables_non_current,
    cast(investments_in_other_ventures_under_equity_method as decimal(18, 2)) as investments_in_other_ventures_equity_method,
    cast(investment_properties as decimal(18, 2)) as investment_properties,
    cast(fixed_assets_revaluation_reserve as decimal(18, 2)) as fixed_assets_revaluation_reserve,
    cast(preferred_stock as decimal(18, 2)) as preferred_stock,
    cast(defined_pension_benefit as decimal(18, 2)) as defined_pension_benefit,
    cast(non_current_accrued_expenses as decimal(18, 2)) as non_current_accrued_expenses,
    cast(investments_and_advances as decimal(18, 2)) as investments_and_advances,
    cast(receivables as decimal(18, 2)) as receivables,
    cast(cash_cash_equivalents_and_federal_funds_sold as decimal(18, 2)) as cash_equivalents_and_federal_funds_sold,
    cast(treasury_stock as decimal(18, 2)) as treasury_stock,
    cast(inventories_adjustments_allowances as decimal(18, 2)) as inventories_adjustments_allowances,
    cast(non_current_deferred_assets as decimal(18, 2)) as non_current_deferred_assets,
    cast(investmentsin_subsidiariesat_cost as decimal(18, 2)) as investments_in_subsidiaries_cost,
    cast(current_deferred_assets as decimal(18, 2)) as current_deferred_assets,
    cast(preferred_shares_number as decimal(18, 2)) as preferred_shares_number,
    cast(gains_losses_not_affecting_retained_earnings as decimal(18, 2)) as gains_losses_not_affecting_retained_earnings,
    cast(other_equity_adjustments as decimal(18, 2)) as other_equity_adjustments,
    cast(non_current_deferred_liabilities as decimal(18, 2)) as non_current_deferred_liabilities,
    cast(current_deferred_liabilities as decimal(18, 2)) as current_deferred_liabilities,
    cast(current_deferred_revenue as decimal(18, 2)) as current_deferred_revenue,
    cast(other_current_borrowings as decimal(18, 2)) as other_current_borrowings,
    cast(line_of_credit as decimal(18, 2)) as line_of_credit,
    cast(payables_and_accrued_expenses as decimal(18, 2)) as payables_and_accrued_expenses,
    cast(current_accrued_expenses as decimal(18, 2)) as current_accrued_expenses,
    cast(non_current_accounts_receivable as decimal(18, 2)) as non_current_accounts_receivable,
    cast(current_deferred_taxes_assets as decimal(18, 2)) as current_deferred_taxes_assets,
    cast(liabilities_heldfor_sale_non_current as decimal(18, 2)) as liabilities_held_for_sale_non_current,
    cast(current_notes_payable as decimal(18, 2)) as current_notes_payable,
    cast(employee_benefits as decimal(18, 2)) as employee_benefits,
    cast(income_tax_payable as decimal(18, 2)) as income_tax_payable,
    cast(non_current_note_receivables as decimal(18, 2)) as non_current_note_receivables,
    cast(accrued_interest_receivable as decimal(18, 2)) as accrued_interest_receivable,
    cast(loans_receivable as decimal(18, 2)) as loans_receivable,
    cast(preferred_stock_equity as decimal(18, 2)) as preferred_stock_equity,
    cast(receivables_adjustments_allowances as decimal(18, 2)) as receivables_adjustments_allowances,
    cast(dueto_related_parties_non_current as decimal(18, 2)) as due_to_related_parties_non_current,
    cast(dueto_related_parties_current as decimal(18, 2)) as due_to_related_parties_current,
    cast(duefrom_related_parties_non_current as decimal(18, 2)) as due_from_related_parties_non_current,
    cast(duefrom_related_parties_current as decimal(18, 2)) as due_from_related_parties_current,
    cast(commercial_paper as decimal(18, 2)) as commercial_paper,
    cast(interest_payable as decimal(18, 2)) as interest_payable,
    cast(notes_receivable as decimal(18, 2)) as notes_receivable,
    cast(replace(bs.security_id, '.BO', '') as varchar(25)) as security_id,
    cast(cast(bs.security_code as float) as int) as security_code

from financial_analytics.staging.balance_sheet bs
inner join financial_analytics.dbo.securities s
    on s.security_code = bs.security_code
    and s.security_id = replace(bs.security_id, '.BO', '')
where total_assets is not null and current_liabilities is not null;