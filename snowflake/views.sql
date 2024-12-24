use database financial_analytics_wh;
use schema analytics;

create or replace view FINANCIAL_ANALYTICS_WH.ANALYTICS.EQUITY_INSIGHTS(
	ID,
	DATE,
	OPEN_PRICE,
	HIGH_PRICE,
	LOW_PRICE,
	CLOSE_PRICE,
	WAP,
	NO_OF_SHARES,
	NO_OF_TRADES,
	TOTAL_TURNOVER_RS,
	DELIVERABLE_QUANTITY,
	PERCENT_DELI_QTY_TO_TRADED_QTY,
	SPREAD_HIGH_LOW,
	SPREAD_CLOSE_OPEN,
	SECURITY_ID,
	SECURITY_CODE,
	MARKET_SENTIMENT,
	PRICE_GAP,
	TREND,
	PRICE_PATTERN,
	STOP_LOSS_LEVEL,
	TAKE_PROFIT_LEVEL,
	PERCENTAGE_DELI_QTY_TO_TRADED_QTY
) as
SELECT
  *,
  -- Market sentiment: The relationship between the open and close prices can provide insights into market sentiment.
  CASE
    WHEN close_price > open_price THEN 'Positive Market Sentiment'
    WHEN close_price < open_price THEN 'Negative Market Sentiment'
  ELSE
  'Neutral Market Sentiment'
END
  AS market_sentiment,
  -- Price gaps: Price gaps occur when the close price of one trading day is different from the open price of the following trading day.
 --  LAG(close_price) OVER (PARTITION BY security_id ORDER BY date) AS gap,
  CASE
    WHEN open_price > LAG(close_price) OVER (PARTITION BY security_id ORDER BY date) THEN 'Gap Up'
    WHEN open_price < LAG(close_price) OVER (PARTITION BY security_id ORDER BY date) THEN 'Gap Down'
  ELSE
  'No Gap'
END
  AS price_gap,
  -- Trend identification: Analyzing the high and low prices over multiple trading periods can help identify trends in the stock's price movement.
  CASE
    WHEN low_price < LAG(low_price) OVER (PARTITION BY security_id ORDER BY date) AND high_price < LAG(high_price) OVER (PARTITION BY security_id ORDER BY date) THEN 'Downward Trend'
    WHEN low_price > LAG(low_price) OVER (PARTITION BY security_id ORDER BY date)
  AND high_price > LAG(high_price) OVER (PARTITION BY security_id ORDER BY date) THEN 'Upward Trend'
  ELSE
  'No Clear Trend'
END
  AS trend,
  -- Price patterns: The high and low prices can contribute to the identification of various price patterns, such as double tops, double bottoms, head and shoulders patterns, and triangles.
  CASE
    WHEN high_price = low_price THEN 'Consolidation'
    WHEN high_price > LAG(high_price) OVER (PARTITION BY security_id ORDER BY date)
  AND low_price > LAG(low_price) OVER (PARTITION BY security_id ORDER BY date) THEN 'Uptrend Continuation'
    WHEN high_price < LAG(high_price) OVER (PARTITION BY security_id ORDER BY date) AND low_price < LAG(low_price) OVER (PARTITION BY security_id ORDER BY date) THEN 'Downtrend Continuation'
  ELSE
  'No Clear Pattern'
END
  AS price_pattern,
  -- Stop loss and take profit levels: Traders often use the high and low prices to set stop loss and take profit levels.
  low_price * 0.95 AS stop_loss_level,
  high_price * 1.05 AS take_profit_level,
  -- "WAP" stands for Weighted Average Price. The Weighted Average Price represents the average price at which a stock has traded during a specific trading session.
  -- "Deliverable Quantity" refers to the number of shares that were actually delivered or transferred between buyers and sellers during a particular trading period.
  ROUND((Deliverable_quantity / no_of_shares) * 100,2) AS Percentage_Deli_Qty_to_Traded_Qty,
  --  Spread_High_Low and Spread_Close_Open provide information about the price movement and volatility of a stock.
  --ROUND(high_price - low_price,2) AS spread_high_low,
 -- ROUND(close_price - open_price,2) AS spread_close_open
FROM (
  SELECT
    DISTINCT * 
  FROM
    financial_analytics_wh.staging.stock_price_history) a
    --WHERE security_id = 'Adani Ports'
ORDER BY
  date;



create or replace view FINANCIAL_ANALYTICS_WH.ANALYTICS.FINANCIALS(
	SECURITY_CODE,
	SECURITY_NAME,
	DATE,
	TOTAL_REVENUE,
	GROSS_PROFIT,
	NET_INCOME,
	TOTAL_EXPENSES,
	SHARE_ISSUED,
	TOTAL_CAPITALIZATION,
	TOTAL_ASSETS,
	CURRENT_LIABILITIES,
	CURRENT_DEBT
) as
select distinct  se.security_code
                ,se.security_name
                ,si.date
                ,si.total_revenue
                ,si.gross_profit
                ,si.net_income
                ,si.total_expenses
                ,bs.share_issued
                ,bs.total_capitalization
                ,bs.total_assets
                ,bs.current_liabilities
                ,bs.current_debt
                
                
                
from financial_analytics_wh.staging.securities se
inner join financial_analytics_wh.staging.income_statement si
    on si.security_id = se.security_id
    and si.security_code = se.security_code
inner join financial_analytics_wh.staging.cash_flow cf
    on cf.security_id = se.security_id
    and cf.security_code = se.security_code
inner join financial_analytics_wh.staging.balance_sheet bs
    on bs.security_id = se.security_id
    and bs.security_code = se.security_code
inner join financial_analytics_wh.staging.basic_industry bi
    on bi.basic_industry_search_optimized = se.isubgroup_name_search_optimized
inner join financial_analytics_wh.staging.industry i
    on i.ind_code = bi.ind_code
inner join financial_analytics_wh.staging.sector sc
    on sc.sect_code = i.sect_code
order by se.security_name, si.date desc;
