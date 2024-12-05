create view staging.vw_stock_price_history as
select  
    CONVERT(DATE, REPLACE(date, '-', ' '), 107) as formatted_date,                       -- alias for date
    cast(open_price as float) as open_price,                                            -- alias for open price
    cast(high_price as float) as high_price,                                            -- alias for highest price during the day
    cast(low_price as float) as low_price,                                              -- alias for lowest price during the day
    cast(close_price as float) as close_price,                                          -- alias for closing price
    cast(wap as float) as weighted_avg_price,                                           -- alias for weighted average price
    cast(cast(no_of_shares as float) as int) as number_of_shares_traded,                -- alias for number of shares traded
    cast(cast(no_of_trades as float) as int) as number_of_trades,                       -- alias for number of trades executed
    cast(total_turnover_rs as float) as total_turnover_in_rs,                           -- alias for total turnover in rupees
    cast(cast(deliverable_quantity as float) as int) as deliverable_quantity,           -- alias for quantity of shares delivered
    cast(percent_deli_qty_to_traded_qty as float) as percent_deliverable_to_traded,     -- alias for percentage deliverable to traded
    cast(spread_high_low as float) as spread_high_low,                                  -- alias for spread between high and low prices
    cast(spread_close_open as float) as spread_close_open,                              -- alias for spread between closing and opening prices
    cast(sph.security_id as varchar(25)) as security_id,                                -- alias for unique ticker symbol for stock
    cast(cast(sph.security_code as float) as int) as security_code                      -- alias for stock security code
from financial_analytics.staging.stock_price_history sph
inner join financial_analytics.staging.bse_sp500 sp
    on sp.security_code = sph.security_code
inner join financial_analytics.dbo.securities s
    on s.security_code = sph.security_code
    and s.security_id = sph.security_id;
