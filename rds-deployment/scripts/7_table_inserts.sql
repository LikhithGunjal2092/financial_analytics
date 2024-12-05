use financial_analytics;

--============================================================================================================================
---- SECTOR MACROECONOMIC INDICATOR TO DBO - START----------------------------------------------------------------------------
--============================================================================================================================

truncate table dbo.macroeconomic_indicator ;
insert into dbo.macroeconomic_indicator (mei_code ,macro_economic_indicator)
values 
 ('IN01','Commodities')
,('IN02','Consumer Discretionary')
,('IN03','Energy')
,('IN04','Fast Moving Consumer Goods')
,('IN05','Financial Services')
,('IN06','Healthcare')
,('IN07','Industrials')
,('IN08','Information Technology')
,('IN09','Services')
,('IN10','Telecommunication')
,('IN11','Utilities')
,('IN12','Diversified');


--============================================================================================================================
---- SECTOR MACROECONOMIC INDICATOR TO DBO - END------------------------------------------------------------------------------
--============================================================================================================================


-------------------------------------------------------------------------------------------------------------------------------------------------


--============================================================================================================================
---- SECTOR INSERT TO DBO - START---------------------------------------------------------------------------------------------
--============================================================================================================================


truncate table dbo.sector ;
insert into dbo.sector (sect_code,mei_code,sector)
values 
 ('IN0101','IN01','Chemicals')
,('IN0102','IN01','Construction Materials')
,('IN0103','IN01','Metals & Mining')
,('IN0104','IN01','Forest Materials')
,('IN0201','IN02','Automobile and Auto Components')
,('IN0202','IN02','Consumer Durables')
,('IN0203','IN02','Textiles')
,('IN0204','IN02','Media, Entertainment & Publication')
,('IN0205','IN02','Realty')
,('IN0206','IN02','Consumer Services')
,('IN0301','IN03','Oil, Gas & Consumable Fuels')
,('IN0401','IN04','Fast Moving Consumer Goods')
,('IN0501','IN05','Financial Services')
,('IN0601','IN06','Healthcare')
,('IN0701','IN07','Construction')
,('IN0702','IN07','Capital Goods')
,('IN0801','IN08','Information Technology')
,('IN0901','IN09','Services')
,('IN1001','IN10','Telecommunication')
,('IN1101','IN11','Power')
,('IN1102','IN11','Utilities')
,('IN1201','IN12','Diversified');

--============================================================================================================================
---- SECTOR INSERT TO DBO - END-----------------------------------------------------------------------------------------------
--============================================================================================================================

------------------------------------------------------------------------------------------------------------------------------------------

--============================================================================================================================
---- INDUSTRIES INSERT TO DBO - START-----------------------------------------------------------------------------------------
--============================================================================================================================

truncate table dbo.industry;
insert into dbo.industry (ind_code,sect_code,industry)
values ('IN010101','IN0101','Chemicals & Petrochemicals')
,('IN010102','IN0101','Fertilizers & Agrochemicals')
,('IN010203','IN0102','Cement & Cement Products')
,('IN010204','IN0102','Other Construction Materials')
,('IN010301','IN0103','Ferrous Metals')
,('IN010302','IN0103','Non - Ferrous Metals')
,('IN010303','IN0103','Diversified Metals')
,('IN010304','IN0103','Minerals & Mining')
,('IN010305','IN0103','Metals & Minerals Trading')
,('IN010401','IN0104','Paper, Forest & Jute Products')
,('IN020101','IN0201','Automobiles')
,('IN020102','IN0201','Auto Components')
,('IN020201','IN0202','Consumer Durables')
,('IN020301','IN0203','Textiles & Apparels')
,('IN020401','IN0204','Media')
,('IN020402','IN0204','Entertainment')
,('IN020403','IN0204','Printing & Publication')
,('IN020501','IN0205','Realty')
,('IN020601','IN0206','Leisure Services')
,('IN020602','IN0206','Other Consumer Services')
,('IN020603','IN0206','Retailing')
,('IN030101','IN0301','Gas')
,('IN030102','IN0301','Oil')
,('IN030103','IN0301','Petroleum Products')
,('IN030104','IN0301','Consumable Fuels')
,('IN040101','IN0401','Agricultural Food & other Products')
,('IN040102','IN0401','Beverages')
,('IN040103','IN0401','Cigarettes & Tobacco Products')
,('IN040104','IN0401','Food Products')
,('IN040105','IN0401','Personal Products')
,('IN040106','IN0401','Household Products')
,('IN040107','IN0401','Diversified FMCG')
,('IN050101','IN0501','Finance')
,('IN050102','IN0501','Banks')
,('IN050103','IN0501','Capital Markets')
,('IN050104','IN0501','Insurance')
,('IN050105','IN0501','Financial Technology (Fintech)')
,('IN060101','IN0601','Pharmaceuticals & Biotechnology')
,('IN060102','IN0601','Healthcare Equipment & Supplies')
,('IN060103','IN0601','Healthcare Services')
,('IN070101','IN0701','Construction')
,('IN070201','IN0702','Aerospace & Defense')
,('IN070202','IN0702','Agricultural, Commercial & Construction Vehicles')
,('IN070203','IN0702','Electrical Equipment')
,('IN070204','IN0702','Industrial Manufacturing')
,('IN070205','IN0702','Industrial Products')
,('IN080101','IN0801','IT - Software')
,('IN080102','IN0801','IT - Services')
,('IN080103','IN0801','IT - Hardware')
,('IN090101','IN0901','Engineering Services')
,('IN090102','IN0901','Transport Services')
,('IN090103','IN0901','Transport Infrastructure')
,('IN090104','IN0901','Commercial Services & Supplies')
,('IN090105','IN0901','Public Services')
,('IN100101','IN1001','Telecom - Services')
,('IN100102','IN1001','Telecom - Equipment & Accessories')
,('IN110101','IN1101','Power')
,('IN110201','IN1102','Other Utilities')
,('IN120101','IN1201','Diversified');

--============================================================================================================================
---- INDUSTRIES INSERT TO DBO - END ------------------------------------------------------------------------------------------
--============================================================================================================================


------------------------------------------------------------------------------------------------------------------------------------------


--============================================================================================================================
---- BASIC INDUSTRIES INSERT TO DBO - START-----------------------------------------------------------------------------------
--============================================================================================================================


insert into dbo.basic_industry( basic_ind_code ,ind_code ,basic_industry ,basic_industry_definition )
values ('IN010101001','IN010101','Manufacturers of basic and industrial chemicals like
synthetic fibres, films, organic and inorganic
chemicals etc.','Commodity Chemicals')
,('IN010101002','IN010101','Manufacturers of chemicals used in the
manufacture of a variety of products, like fine
chemicals, additives, advanced polymers,
explosives, adhesives, printing inks, sealants, dyes,
pigments, coatings etc.','Specialty Chemicals')
,('IN010101003','IN010101','Manufacturers of carbon black','Carbon Black')
,('IN010101004','IN010101','Manufacturer, supplier and distributor of dyes and
pigments','Dyes And Pigments')
,('IN010101005','IN010101','Manufacturer, supplier and exporter of commercial
explosives and explosive accessories','Explosives')
,('IN010101006','IN010101','Manufacturer, supplier and distributor of
petrochemical products like propylene oxide,
propylene glycols and polyols etc. Also includes
manufacturers of nylon, polyester and acrylic fibres,
plastics (not covered under Plastic Products -
Consumer under Consumer Discretionary and
Plastic Products - Industrial under Manufacturing)
etc.','Petrochemicals')
,('IN010101007','IN010101','Manufacturers and distributor of printing inks and
allied material','Printing Inks')
,('IN010101008','IN010101','Trading companies and distributors of chemicals','Trading - Chemicals')
,('IN010101009','IN010101','Producer or supplier of industrial gases','Industrial Gases')
,('IN010102001','IN010102','Manufacturers of fertilizers','Fertilizers')
,('IN010102002','IN010102','Manufacturers of agrochemicals and pesticides','Pesticides &
Agrochemicals')
,('IN010203001','IN010203','Manufacturer, supplier and distributor of cement,
cement products','Cement & Cement
Products')
,('IN010204001','IN010204','Other construction material such as supplier of sand
etc. It excludes companies dealing with granites,
marbles, etc. which are classified as separate basic
industry under Consumer Discretionary','Other Construction
Materials')
,('IN010301001','IN010301','Manufacturers and distributor of ferro silico
manganese like ferro alloys, briquette, fly ash bricks
etc.','Ferro & Silica Manganese')
,('IN010301002','IN010301','Manufacturers and distributor of pig iron','Pig Iron')
,('IN010301003','IN010301','Manufacturers and distributor of sponge iron','Sponge Iron')
,('IN010301004','IN010301','Manufacturers of Iron & steel','Iron & Steel')
,('IN010302001','IN010302','Mining, processing, manufacturing and distributing
the aluminium','Aluminium')
,('IN010302002','IN010302','Producer and distributor of copper','Copper')
,('IN010302003','IN010302','Producer and distributor of zinc','Zinc')
,('IN010302004','IN010302','Mining, manufacturing and distributing precious
materials like gold, silver, platinum etc. Includes
investment trusts where underlying is gold or
similar precious metals','Precious Metals')
,('IN010303001','IN010303','Companies engaged in manufacturing and mining
of diversified metals','Diversified Metals')
,('IN010304001','IN010304','Mining, producing and distributing industrial
materials (excluding Coal which has been classified
under  Energy )','Industrial Minerals')
,('IN010305001','IN010305','Trading companies and distributors of metals
(excluding precious metals)','Trading - Metals')
,('IN010305002','IN010305','Trading companies and distributors of industrial
minerals (excluding Coal trading which has been
classified under  Energy )','Trading - Minerals')
,('IN010401001','IN010401','Manufacturers of paper, paper boards etc.','Paper & Paper Products')
,('IN010401002','IN010401','Companies dealing with Timber, Wood, Soil, Pulp,
Firewood, Cork, Shellac, Cross Laminated Timber
excluding plywood and laminates which is classified
as  Furniture, Home Furnishing, Flooring  under
Consumer Discretionary','Forest Products')
,('IN010401003','IN010401','Manufacturers of jute and jute products','Jute & Jute Products')
,('IN020101001','IN020101','Manufacturer of passenger /utility vehicles
including car, bus, taxis, auto rickshaws etc.','Passenger Cars & Utility
Vehicles')
,('IN020101002','IN020101','Manufacturers of motorcycles, scooters, three-
wheelers (does not include bicycles and tricycles)','2/3 Wheelers')
,('IN020101004','IN020101','Trading and distribution of passenger cars, utility
vehicles, 2/3 wheelers','Auto-Dealer')
,('IN020102001','IN020102','Manufacturers and distributors of accessories for
automobiles, batteries, fastners, gas cylinders for
automobile etc.','Auto Components & Equipments')
,('IN020102006','IN020102','Manufacturers and distributors of tyres and rubber
products for automobile','Tyres & Rubber Products')
,('IN020102007','IN020102','Trading and distribution of auto components','Trading - Auto
Components')
,('IN020201002','IN020201','Manufacturers and distributors of bicycles and
tricycles','Cycles')
,('IN020201003','IN020201','Manufacturers and distributor of consumer
electronics like television, video cassette recorder,
DVD player, audio equipments, games etc.','Consumer Electronics')
,('IN020201018','IN020201','Manufacturer/ distributor of furniture, carpets,
curtains and other home furnishing products','Furniture, Home
Furnishing')
,('IN020201019','IN020201','Manufacturer/ distributor of floor and wall tiles','Ceramics')
,('IN020201020','IN020201','Manufacturer/ distributor of granites and marbles','Granites & Marbles')
,('IN020201005','IN020201','Manufacturers and distributor of gems, jewellery,
watches and other luxury goods and accessories
including companies engaged into cutting &
polishing diamonds','Gems, Jewellery And
Watches')
,('IN020201006','IN020201','Manufacturers and distributor of consumer glass
products','Glass - Consumer')
,('IN020201007','IN020201','Manufacturers of electric household appliances like
air conditioners, juicers, food processors,
microwave ovens etc.','Household Appliances')
,('IN020201008','IN020201','Manufacturers and distributors of other household
durable products like cookware, cutlery, utensils
and consumer specialties not classified otherwise','Houseware')
,('IN020201009','IN020201','Manufacturers and distributors of leather products
such as belt, leather bags, all types of footwear etc.','Leather And Leather
Products')
,('IN020201010','IN020201','Manufacturers of leisure products and equipment
including sports equipment, gift articles, toys,
games etc.','Leisure Products')
,('IN020201011','IN020201','Manufacturers and distributor of plastic products
used in households such as suitcase, briefcase and
other consumer plastic products not covered under
 Houseware  above','Plastic Products -
Consumer')
,('IN020201012','IN020201','Manufacturers and distributor of plywood,
laminates etc.','Plywood Boards/
Laminates')
,('IN020201013','IN020201','Manufacturer of sanitary ware like ceramic
plumbing fixtures (as sinks, lavatories, or toilet
bowls)','Sanitary Ware')
,('IN020201015','IN020201','Manufacturers and distributors of interior and
exterior paints','Paints')
,('IN020201016','IN020201','Any other consumer products not covered above','Diversified consumer
products')
,('IN020201017','IN020201','Companies engaged in manufacturing, trading and
distribution of all types of footwear and related
accessories','Footwear')
,('IN020301001','IN020301','Manufacturers & distributors of apparels/
garments, knitwears, innerwears etc.','Garments & Apparels')
,('IN020301002','IN020301','Manufacturers & distributors of textiles, fabrics,
yarn, silk yarn, blended and texturized yarn and
related products. Includes spinning of cotton/
synthetic/ other yarn and companies engaged in
cotton ginning operations','Other Textile Products')
,('IN020301003','IN020301','Trading and Distribution of  garments & apparels 
and  other textile products  where a revenue from
each segment can not be determined separately','Trading - Textile Products')
,('IN020401001','IN020401','Companies providing advertising, public relations
and marketing services. It also includes billboard
providers and telemarketers.','Advertising & Media
Agencies')
,('IN020401002','IN020401','Publisher of newspapers, magazines and other
periodicals through electronic medium','Electronic Media')
,('IN020401003','IN020401','Companies engaged in providing social media,
search engines, platforms for networking etc.
Excludes companies operating in online shopping
classified under E-Retail/ E-Commerce and
companies providing online directory of suppliers
and potential buyers for various products/
merchandise classified under Internet & Catalogue
Retail','Web based media and
service')
,('IN020401004','IN020401','Publisher of newspapers, magazines and other
periodicals through print medium','Print Media')
,('IN020402001','IN020402','Producers and distributors of movies. Includes
theatres and auditoriums','Film Production,
Distribution & Exhibition')
,('IN020402002','IN020402','Producers and distributors of movies and other
entertainment related contents through digital,
Over the Top (OTT) platform.','Digital Entertainment')
,('IN020402003','IN020402','Producers and distributors of entertainment
products and services. It includes companies
engaged in the production, distribution and
screening of television shows, producers and
distributors of music and sports teams. It excludes
production and distribution of movies which is
classified under  Film Production, Distribution &
Exhibition .','Media & Entertainment')
,('IN020402004','IN020402','Owners of TV channels, includes broadcasting of TV
shows and cable TV operators and DTH service
providers','TV Broadcasting & Software Production')
,('IN020403001','IN020403','Companies providing service of commercial
printing, publication of books, commercial
documents etc,','Printing & Publication')
,('IN020501001','IN020501','Companies engaged in development and
construction of residential/ commercial
(offices/shops etc.) properties','Residential, Commercial
Projects')
,('IN020501002','IN020501','Companies engaged in providing real estate related
services like real estate agents, real estate leasing,
real estate data analytics etc.','Real Estate related
services')
,('IN020501003','IN020501','Companies or Trusts engaged in ownership,
acquisition, development, management and
operation of real estate','Real Estate Investment
Trusts (REITs)')
,('IN020601001','IN020601','Owners and operators of hotels, resorts etc.
Includes investment trusts where underlying is
 Hotels and Resorts ','Hotels & Resorts')
,('IN020601002','IN020601','Owners and operators of restaurants, recreation
clubs, bars, coffee shops, fast-food, catering service
etc.','Restaurants')
,('IN020601003','IN020601','Owners and operators of amusement parks, Casinos
and other recreation facilities not covered above','Amusement Parks/ Other
Recreation')
,('IN020601004','IN020601','Owners and operators of wellness facilities such as
gymnasium, yoga centre, beauty parlours, salons
etc.','Wellness')
,('IN020601005','IN020601','Companies engaged into provision of tour, travel
related services. It includes tour operators,
ticketing, visa processing, hotel and vehicle booking
etc. It includes companies that provide such service
through digital medium','Tour, Travel Related
Services')
,('IN020602001','IN020602','Any stream of education (including IT education or
any specialized training) provided in classroom','Education')
,('IN020602002','IN020602','Any stream of education (including IT education or
any specialized training) provided through medium
other than classroom','E-Learning')
,('IN020602003','IN020602','Companies engaged in providing food storage
facility','Food Storage Facilities')
,('IN020602004','IN020602','Companies providing other consumer services not
classified elsewhere. It includes event managers,
security services, housekeeping services etc.','Other Consumer Services')
,('IN020603001','IN020603','Owners and operators of retail store comprising a
single class of goods such as apparels, electronics,
stationary etc.','Speciality Retail')
,('IN020603002','IN020603','Companies engaged in sale of pharmaceutical,
provision of health related products and services
through electronic medium','Pharmacy Retail')
,('IN020603003','IN020603','Owners and operators of stores offering multiple
range of product categories (department stores)','Diversified Retail')
,('IN020603004','IN020603','Companies that earns significant revenue from
provision of products or services predominantly
through electronic medium such as internet.','E-Retail/ E-Commerce')
,('IN020603005','IN020603','Companies providing online directory of suppliers
and potential buyers for various products/
merchandise','Internet & Catalogue
Retail')
,('IN020603006','IN020603','Distributors and wholesalers of general
merchandise not classified elsewhere','Distributors')
,('IN030101001','IN030101','Companies engaged in marketing and/ or
transportation of gases','Gas
Transmission/Marketing')
,('IN030101003','IN030101','Companies engaged in distribution of LPG, CNG,
PNG and LNG','LPG/CNG/PNG/LNG
Supplier')
,('IN030101004','IN030101','Companies engaged in the activity of trading in gas','Trading - Gas')
,('IN030102001','IN030102','Companies engaged in the exploration and
production of oil','Oil Exploration &
Production')
,('IN030102002','IN030102','Companies providing offshore drilling services to oil
companies','Offshore Support Solution
Drilling')
,('IN030102003','IN030102','Companies engaged in providing storage and
transportation facility for oil companies','Oil Storage &
Transportation')
,('IN030102004','IN030102','Manufacturers of equipment for and providers of
services to the oil and gas industry','Oil Equipment & Services')
,('IN030103001','IN030103','Companies engaged in the refining and marketing
of oil, gas and petroleum products','Refineries & Marketing')
,('IN030103002','IN030103','Manufacturers and distributors of lubricants','Lubricants')
,('IN030104001','IN030104','Companies engaged in exploration, mining and
distribution of coal, coke and lignite etc.','Coal')
,('IN030104002','IN030104','Companies engaged in trading and distribution of
coal, coke and lignite etc.','Trading - Coal')
,('IN040101001','IN040101','Producers and distributors of edible oil','Edible Oil')
,('IN040101002','IN040101','Producers and distributors of sugar and allied
products','Sugar')
,('IN040101003','IN040101','Producers and distributors of tea and coffee','Tea & Coffee')
,('IN040101004','IN040101','Producers and distributors of agricultural products
not classified elsewhere','Other Agricultural
Products')
,('IN040102001','IN040102','Manufacturers of alcoholic beverages. Includes
distillers','Breweries & Distilleries')
,('IN040102002','IN040102','Manufacturers of non-alcoholic beverages','Other Beverages')
,('IN040103001','IN040103','Manufacturers and distributors of cigarettes and
other tobacco products','Cigarettes & Tobacco
Products')
,('IN040104001','IN040104','Manufacturers and distributors of animal feed','Animal Feed')
,('IN040104002','IN040104','Producers and distributors of dairy products','Dairy Products')
,('IN040104003','IN040104','Producers and distributors of other food products
not classified elsewhere','Other Food Products')
,('IN040104004','IN040104','Producers & distributors of packaged foods
including biscuits, chocolates, chips etc.','Packaged Foods')
,('IN040104005','IN040104','Culture and processors of fish, shrimp and other
sea/ fresh water food','Seafood')
,('IN040104006','IN040104','Processors of meat and/ or breeders and processors
of chicken and eggs','Meat Products including
Poultry')
,('IN040105001','IN040105','Manufacturers and distributors of personal
products such as tooth paste, shampoo, perfume,
cosmetics etc.','Personal Care')
,('IN040106001','IN040106','Manufacturers and distributors of household
products such as aluminium foils, detergents,
matchstick, paper tissues, soaps etc., manufacturers
and distributors of batteries used in home
appliances. Excludes automobiles batteries
classified under  Consumer Discretionary ,
manufacturers and distributors of photographic
products','Household Products')
,('IN040106004','IN040106','Manufacturers and distributors of stationary such
as pen, pencil, notebooks etc.','Stationary')
,('IN040107001','IN040107','Companies engaged into multiple FMCG products,
where no single business segment contributes more
than 50% of companies  total revenue and two or
more segments each contributes at least 20% of
total revenue','Diversified FMCG')
,('IN050101001','IN050101','Financial Institutions as defined under Section 4(1)
of the Companies Act, 1956','Financial Institution')
,('IN050101002','IN050101','Companies providing loan for buying housing and
commercial properties','Housing Finance Company')
,('IN050101003','IN050101','Companies which earn major revenue from
interest, capital appreciation from investments
made. It does not include rental income which is
classified under  Diversified Commercial Services ','Investment Company')
,('IN050101004','IN050101','Non Banking Financial Company (NBFC) as may be
specified by the Reserve Bank of India (RBI). It
excludes companies classified under basic industry
 Microfinance Institutions ','Non Banking Financial
Company (NBFC)')
,('IN050101005','IN050101','Companies providing financial services not covered
elsewhere under  Financial Services ','Other Financial Services')
,('IN050101006','IN050101','Holding companies with holding of 51% or more in
other company','Holding Company')
,('IN050101007','IN050101','Microfinance companies as may be specified by the
Reserve Bank of India (RBI).','Microfinance Institutions')
,('IN050101008','IN050101','Trusts that issue pass-through certificates, which
include asset-backed securities, mortgage-backed
securities, corporate assets-backed securities,
besides other securitisation transactions','Securitisation')
,('IN050102001','IN050102','Banks sponsored by Central or State government in
India categorized as public sector bank by Reserve
Bank of India (RBI)','Public Sector Bank')
,('IN050102002','IN050102','Banks categorized as private sector banks by
Reserve Bank of India (RBI)','Private Sector Bank')
,('IN050102003','IN050102','Other banks not classified under Public Sector Bank
and Private Sector Bank above. Includes foreign
banks, payment banks, small banks etc.','Other Bank')
,('IN050103001','IN050103','Companies engaged in mutual fund activities i.e.
companies operating mutual funds, open-end
mutual funds, closed-end mutual funds etc.','Asset Management
Company')
,('IN050103002','IN050103','Companies providing depository services. Includes
clearing houses/ clearing corporations, registrar/
share transfer agents, custodians etc. which are not
covered elsewhere under  Capital Markets ','Depositories, Clearing
Houses and Other
Intermediaries')
,('IN050103003','IN050103','Companies engaged into distribution of financial
products','Financial Products
Distributor')
,('IN050103004','IN050103','Companies providing ratings service','Ratings')
,('IN050103005','IN050103','Companies providing platform for trading of equity,
commodity, currency, fixed income securities,
power etc. are classified under  Exchange
Platform .Companies providing data vending/ data
dissemination are classified under  Data Platform ','Exchange and Data
Platform')
,('IN050103006','IN050103','Companies engaged in providing brokerage services
and other allied activities such as investment
advisory services etc.','Stockbroking & Allied')
,('IN050103007','IN050103','Other Capital Market related Services not classified
elsewhere above','Other Capital Market
related Services')
,('IN050104001','IN050104','Companies providing general insurance','General Insurance')
,('IN050104002','IN050104','Companies providing life insurance','Life Insurance')
,('IN050104003','IN050104','Insurance companies offering multiple line of
insurance such as life insurance, general insurance,
medical insurance, etc.','Other Insurance
Companies')
,('IN050104004','IN050104','Companies engaged into distribution of insurance
products','Insurance Distributors')
,('IN050105001','IN050105','Fintechs providing services like banking, payment
processing, brokerage, aggregation and distribution
of financial products and services','Financial Technology
(Fintech)')
,('IN060101001','IN060101','Manufacturers and distributors of pharmaceuticals
and companies engaged in research & development
of pharmaceuticals','Pharmaceuticals')
,('IN060101002','IN060101','Companies engaged in the development,
manufacturing or marketing and distribution of
products based on biotechnology','Biotechnology')
,('IN060102001','IN060102','Manufacturers and distributors of medical
equipments such as blood pressure monitoring
machine, X-Ray machines, MRI scanners, and
supplies such as injection needles, syringe, gloves
etc.','Medical Equipment &
Supplies')
,('IN060103001','IN060103','Owners and operators of health care facilities. It
includes hospitals, nursing homes and veterinary
hospitals. Includes investment trusts where
underlying is  Hospitals ','Hospital')
,('IN060103002','IN060103','Owners and operators of diagnostic services such as
pathological laboratories, X-Ray and MRI scan
centres, etc.','Healthcare Service
Provider')
,('IN060103003','IN060103','Companies providing healthcare research and
analytics related services','Healthcare Research,
Analytics & Technology')
,('IN070101001','IN070101','Companies engaged in designing, construction and
maintenance of roads, bridges, canals, dams etc. It
also include companies engaged into Engineering,
procurement and construction (EPC) projects. It
excludes companies engaged in construction of
residential and commercial buildings which are
classified as  Realty  under  Consumer
Discretionary . Includes investment trusts where
underlying is  Civil Construction ','Civil Construction')
,('IN070201001','IN070201','Manufacturers of civil and military aerospace and
equipments, defense equipments, defense
electronics and products thereof','Aerospace & Defense')
,('IN070202001','IN070202','Manufacturers of tractors and other farm vehicles','Tractors')
,('IN070202002','IN070202','Manufacturers of commercial vehicles as trucks,
dumpers etc.','Commercial Vehicles')
,('IN070202003','IN070202','Manufacturers of construction vehicles like cranes,
bulldozers etc.','Construction Vehicles')
,('IN070202004','IN070202','Trading and distribution of either of commercial
vehicles, tractors, construction vehicles and
ancillary equipment','Dealers-Commercial
Vehicles, Tractors,
Construction Vehicles')
,('IN070203001','IN070203','Manufacturers and distributors of power generating
equipment and other heavy electrical equipment
such as power turbines, transmission towers, heavy
electrical machinery','Heavy Electrical Equipment')
,('IN070203002','IN070203','Manufactures and distributors of electrical
components or equipment not classified under
Heavy Electrical Equipment','Other Electrical Equipment')
,('IN070204005','IN070204','Manufacturers of railway wagons and EMU coaches','Railway Wagons')
,('IN070204006','IN070204','Companies engaged in ship building and providing
allied services','Ship Building & Allied
Services')
,('IN070204008','IN070204','Manufacturers & distributor of industrial electronics
like CC TV surveillance system, access control
system, fire alarm system, multi-apartment video
door phones, video door phones, intruder alarm
system, fingerprint locks, and remote managed
services etc. It include manufacturers & distributor
of industrial equipment, elevators, escalators etc. It
also include manufacturers & distributors of
engineering and construction related products,
industrial equipments, machinery & other industrial
products','Industrial Products')
,('IN070205003','IN070205','Manufacturers and distributors of electrical cables/
wires. Excludes telecom cables which are classified
as  Telecom - Equipment & Accessories  under
 Telecommunication ','Cables - Electricals')
,('IN070205004','IN070205','Manufacturers and distributors of castings and
forgings. Excludes companies generating majority
revenue from automobile segment and they are
classified as  Auto Components & Equipments 
classified under  Consumer Discretionary ','Castings & Forgings')
,('IN070205008','IN070205','Manufacturers and distributors of packaging
materials such as cardboard, bags, boxes, cans,
drums, bottles and jars and glass','Packaging')
,('IN070205009','IN070205','Manufacturers and distributors of industrial plastic
products such as plastic pipes etc.','Plastic Products - Industrial')
,('IN070205011','IN070205','Manufacturers and distributors of rubber and
rubber products. Excludes companies classified as
 Tyres & Rubber Products  under  Consumer
Discretionary ','Rubber')
,('IN070205012','IN070205','Manufacturers and distributors of other industrial
products not classified elsewhere','Other Industrial Products')
,('IN070205013','IN070205','Manufacturers and distributors of industrial glasses.
It excludes consumer glass classified under
 Consumer Discretionary ','Glass - Industrial')
,('IN070205014','IN070205','Manufacturers and distributors of aluminium,
copper and zinc products','Aluminium, Copper & Zinc
Products')
,('IN070205015','IN070205','Manufacturers and distributors of iron and steel
products','Iron & Steel Products')
,('IN070205016','IN070205','Manufacturers and distributors of abrasives and
bearings. Excludes bearings used for automobiles
which are classified as  Auto Components &
Equipments  under Consumer Discretionary','Abrasives & Bearings')
,('IN070205017','IN070205','Manufacturers and distributors of compressors,
diesel engines. Excludes engines used for
automobiles which are classified as  Auto
Components & Equipments  under Consumer
Discretionary','Compressors, Pumps & Diesel Engines')
,('IN070205018','IN070205','Manufacturers and distributors of electrodes and
refractories','Electrodes & Refractories')
,('IN080101001','IN080101','Companies engaged in software development, IT
consulting and data analytics','Computers - Software &
Consulting')
,('IN080101002','IN080101','Companies engaged in development of software
products that can be commonly used by individuals
and corporates','Software Products')
,('IN080102001','IN080102','Companies engaged in providing services for
business automation through provision of IT
infrastructure.','IT Enabled Services')
,('IN080103001','IN080103','Manufactures and distributors of computer
hardware and equipments such as personal
computers, laptops, servers, motherboards,
networking equipments, printers, photo copiers etc.','Computers Hardware &
Equipments')
,('IN090101001','IN090101','Companies providing dredging and related services','Dredging')
,('IN090102001','IN090102','Owners and operators of commercial airlines','Airline')
,('IN090102002','IN090102','Companies providing logistic services, courier,
movers & packers etc.','Logistics Solution Provider')
,('IN090102003','IN090102','Companies providing passenger or cargo
transportation through railways','Railways')
,('IN090102004','IN090102','Companies providing passenger or cargo
transportation through roads','Road Transport')
,('IN090102005','IN090102','Companies providing passenger or cargo
transportation through marine (shipping)','Shipping')
,('IN090102006','IN090102','Other transport related service not covered
elsewhere','Transport Related Services')
,('IN090103001','IN090103','Owners and operators of airports and companies
providing airport related services','Airport & Airport services')
,('IN090103002','IN090103','Owners and operators of marine ports and related
services like marine engineering services','Port & Port services')
,('IN090103004','IN090103','Operators of bridge, highway, toll bridges etc. Does
not include companies engaged into construction of
road, bridges and highways which are classified as
 Civil Construction  under  Manufacturing ','Road Assets–Toll, Annuity,
Hybrid-Annuity')
,('IN090104001','IN090104','Companies engaged in trading and distribution of
goods not covered elsewhere','Trading & Distributors')
,('IN090104002','IN090104','Companies engaged in providing consulting services','Consulting Services')
,('IN090104003','IN090104','Companies engaged in providing commercial
electronic data processing services','Data Processing Services')
,('IN090104004','IN090104','Companies providing commercial and consumer
services not classified elsewhere. Includes,
employment and related services, environmental
services and pollution control services, other
security services, renting and leasing services, trade
and commission agent services etc.','Diversified Commercial
Services')
,('IN090104005','IN090104','Companies engaged in providing Business Process
Outsourcing (BPO)/ Knowledge Process Outsourcing
(KPO) services','Business Process
Outsourcing (BPO)/
Knowledge Process
Outsourcing (KPO)')
,('IN090105001','IN090105','Local bodies that administer or govern a city or a
town','Urban Local Bodies')
,('IN090105002','IN090105','Development authority of a city/ region','Development Authority')
,('IN100101001','IN100101','Companies providing fixed line and cellular telecom
services','Telecom - Cellular & Fixed
line services')
,('IN100101002','IN100101','Companies engaged into provision of telecom
instruments and telecom related infrastructure
services.','Telecom - Infrastructure')
,('IN100101003','IN100101','Companies engaged into provision of broad band
internet service and other telecom related services
not covered elsewhere','Other Telecom Services')
,('IN100102001','IN100102','Manufacturers and distributors of telecom
equipments, cables and other accessories. Includes
investment trusts where underlying is telecom
equipment such as telephone instruments','Telecom - Equipment &
Accessories')
,('IN110101004','IN110101','Companies engaged in the production of renewable
and non-renewable power. Includes
investment trusts where underlying is power
generation','Power Generation')
,('IN110101005','IN110101','Companies / investment trusts with its presence
across multiple segments such as power generation,
transmission and distribution','Integrated Power Utilities')
,('IN110101002','IN110101','Companies engaged into trading of electricity','Power Trading')
,('IN110101003','IN110101','Companies engaged into transmission of electricity.
Includes investment trusts where underlying is
power transmission','Power - Transmission')
,('IN110101006','IN110101','Companies engaged in the distribution of power.
Includes investment trusts where underlying is
power distribution','Power Distribution')
,('IN110201001','IN110201','Companies engaged into water supply and
management','Water Supply &
Management')
,('IN110201002','IN110201','Companies engaged into waste management','Waste Management')
,('IN110201003','IN110201','Companies engaged into providing emergency
services like fire brigade, flood management etc.','Emergency Services')
,('IN110201004','IN110201','Companies providing multiple lines of utilities','Multi Utilities')
,('IN110201005','IN110201','Companies providing utilities not covered
elsewhere','Other Utilities')
,('IN120101001','IN120101','Companies engaged into multiple business
segment, where no single business segment
contributes more than 50% of companies  total
revenue and two or more segments each
contributes at least 20% of total revenue','Diversified');


--============================================================================================================================
---- BASIC INDUSTRIES INSERT TO DBO - END ------------------------------------------------------------------------------------------
--============================================================================================================================


------------------------------------------------------------------------------------------------------------------------------------------


--============================================================================================================================
---- BSE TOP 500 INSERT TO STAGING - START -----------------------------------------------------------------------------------
--============================================================================================================================

drop table if exists financial_analytics.staging.bse_sp500;
create table financial_analytics.staging.bse_sp500 (security_code varchar(25));
insert into financial_analytics.staging.bse_sp500 
values ('542772')
,('523395')
,('524208')
,('541988')
,('500002')
,('500488')
,('500410')
,('532762')
,('539254')
,('512599')
,('541450')
,('532921')
,('533096')
,('542066')
,('543458')
,('540691')
,('535755')
,('500040')
,('543374')
,('500003')
,('543534')
,('542752')
,('532683')
,('532331')
,('500710')
,('533573')
,('539523')
,('506767')
,('521070')
,('500008')
,('540902')
,('500425')
,('543415')
,('543235')
,('543275')
,('532259')
,('533758')
,('508869')
,('500877')
,('543335')
,('543657')
,('515030')
,('500477')
,('500820')
,('540975')
,('532830')
,('506820')
,('500027')
,('540611')
,('524804')
,('539177')
,('540376')
,('532215')
,('532977')
,('500034')
,('532978')
,('500490')
,('530999')
,('502355')
,('500038')
,('541153')
,('532134')
,('532149')
,('532525')
,('500042')
,('500043')
,('506285')
,('500048')
,('509480')
,('541143')
,('500049')
,('500493')
,('500103')
,('500547')
,('532454')
,('544162')
,('543653')
,('532523')
,('500335')
,('532400')
,('540073')
,('526612')
,('500067')
,('501425')
,('500530')
,('532929')
,('500825')
,('543425')
,('543523')
,('511196')
,('532483')
,('524742')
,('531595')
,('513375')
,('500870')
,('519600')
,('500878')
,('544012')
,('532885')
,('532548')
,('532443')
,('500084')
,('500093')
,('542399')
,('500085')
,('543336')
,('500110')
,('504973')
,('511243')
,('532756')
,('500087')
,('532210')
,('543318')
,('533278')
,('540678')
,('532541')
,('500830')
,('543232')
,('543960')
,('531344')
,('506395')
,('543276')
,('541770')
,('500092')
,('539876')
,('542867')
,('500480')
,('532175')
,('500096')
,('542216')
,('543428')
,('523367')
,('500645')
,('506401')
,('543529')
,('543330')
,('532488')
,('540699')
,('532868')
,('539524')
,('500124')
,('500125')
,('543272')
,('532927')
,('505200')
,('500840')
,('522074')
,('531162')
,('540153')
,('532178')
,('543243')
,('540596')
,('500133')
,('500495')
,('500086')
,('531599')
,('500469')
,('541557')
,('500144')
,('500940')
,('532809')
,('543663')
,('532843')
,('543384')
,('543317')
,('532155')
,('540935')
,('509557')
,('540755')
,('507815')
,('543245')
,('500660')
,('532296')
,('543654')
,('505255')
,('532754')
,('544179')
,('500163')
,('540743')
,('532424')
,('500164')
,('533150')
,('532482')
,('509488')
,('500300')
,('500620')
,('506076')
,('524226')
,('542812')
,('539336')
,('532181')
,('500670')
,('533248')
,('500690')
,('532702')
,('543227')
,('531531')
,('517354')
,('517271')
,('532281')
,('541729')
,('500180')
,('540777')
,('509631')
,('500182')
,('500183')
,('500184')
,('500440')
,('541154')
,('513599')
,('500104')
,('500696')
,('500188')
,('543187')
,('543259')
,('544014')
,('517174')
,('540530')
,('532174')
,('540716')
,('540133')
,('541179')
,('500116')
,('539437')
,('532636')
,('530005')
,('542726')
,('532814')
,('540750')
,('500850')
,('530965')
,('532388')
,('542830')
,('543257')
,('544026')
,('543258')
,('532514')
,('534816')
,('532187')
,('532777')
,('500209')
,('500210')
,('539083')
,('538835')
,('539448')
,('524494')
,('532947')
,('541956')
,('500875')
,('523610')
,('506943')
,('532644')
,('532976')
,('532209')
,('532605')
,('500378')
,('532508')
,('532286')
,('531543')
,('543940')
,('500380')
,('523405')
,('533148')
,('543994')
,('500228')
,('533155')
,('543271')
,('530019')
,('533272')
,('535648')
,('532926')
,('544081')
,('532889')
,('500233')
,('522287')
,('543278')
,('532468')
,('500165')
,('543664')
,('532714')
,('517569')
,('540680')
,('533293')
,('532942')
,('500247')
,('542651')
,('530813')
,('543308')
,('500249')
,('533519')
,('540115')
,('500510')
,('543398')
,('540222')
,('543277')
,('541233')
,('500253')
,('543526')
,('523457')
,('512455')
,('500252')
,('540005')
,('500257')
,('543287')
,('539957')
,('500266')
,('500265')
,('532720')
,('500520')
,('533088')
,('532313')
,('531213')
,('500109')
,('543904')
,('531642')
,('532500')
,('523704')
,('500271')
,('543220')
,('543237')
,('543427')
,('543426')
,('542650')
,('538962')
,('541195')
,('513377')
,('543498')
,('532892')
,('526299')
,('500290')
,('534091')
,('533398')
,('539551')
,('524816')
,('532234')
,('532504')
,('534309')
,('500294')
,('500790')
,('532798')
,('533098')
,('540767')
,('513683')
,('526371')
,('543768')
,('532555')
,('543988')
,('543334')
,('533273')
,('500312')
,('533106')
,('532439')
,('543396')
,('532466')
,('523642')
,('532827')
,('500368')
,('543390')
,('506590')
,('533179')
,('532522')
,('500680')
,('500331')
,('500302')
,('543635')
,('540173')
,('539150')
,('531768')
,('542652')
,('524000')
,('532810')
,('532898')
,('522205')
,('533274')
,('542907')
,('500338')
,('500126')
,('500459')
,('533295')
,('532461')
,('532689')
,('539978')
,('543981')
,('532497')
,('542649')
,('543524')
,('531500')
,('532527')
,('524230')
,('520111')
,('540065')
,('532955')
,('532805')
,('530517')
,('500325')
,('534076')
,('541556')
,('543228')
,('535789')
,('517334')
,('543397')
,('543066')
,('540719')
,('505790')
,('534139')
,('540203')
,('532638')
,('500387')
,('532670')
,('511218')
,('543299')
,('500550')
,('543990')
,('533206')
,('500472')
,('532784')
,('532725')
,('543300')
,('532221')
,('503806')
,('540575')
,('543412')
,('500112')
,('500113')
,('542760')
,('542920')
,('532872')
,('524715')
,('532733')
,('500403')
,('512179')
,('509930')
,('500405')
,('543064')
,('532667')
,('503310')
,('539268')
,('543596')
,('532790')
,('500770')
,('500483')
,('532540')
,('500800')
,('500408')
,('501301')
,('500570')
,('500400')
,('500470')
,('544028')
,('532371')
,('532755')
,('540595')
,('540769')
,('503100')
,('500260')
,('500411')
,('522113')
,('532966')
,('500114')
,('500420')
,('532779')
,('500251')
,('521064')
,('533655')
,('517506')
,('540762')
,('520056')
,('532343')
,('532505')
,('542904')
,('532538')
,('532477')
,('532478')
,('532432')
,('532539')
,('512070')
,('517146')
,('543238')
,('532953')
,('507880')
,('532156')
,('502986')
,('541578')
,('540180')
,('543463')
,('500295')
,('524200')
,('500575')
,('532144')
,('514162')
,('505533')
,('500238')
,('507685')
,('532648')
,('505537')
,('504067')
,('533023')
,('543320')
,('532321')
,('531335')

--============================================================================================================================
---- BSE TOP 500 INSERT TO STAGING - END -------------------------------------------------------------------------------------
--============================================================================================================================

--============================================================================================================================
---- STOCK HISTORY BULK INSERT TO STAGING - START -----------------------------------------------------------------------------
--============================================================================================================================


exec msdb.dbo.rds_download_from_s3
      @s3_arn_of_file='arn:aws:s3:::financial-analytics-g5/stock_history_combined_file.csv',
      @rds_file_path='D:\S3\stock_history_combined_file.csv',
      @overwrite_file=1;

	  
--EXEC msdb.dbo.rds_task_status

BULK INSERT  financial_analytics.staging.stock_price_history FROM 'D:\S3\stock_history_combined_file.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW = 2,
    MAXERRORS = 0,
    BATCHSIZE = 50000,
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
	
    
);

--============================================================================================================================
---- STOCK HISTORY BULK INSERT TO STAGING - END ------------------------------------------------------------------------------
--============================================================================================================================


------------------------------------------------------------------------------------------------------------------------------------------------


--============================================================================================================================
---- INCOME STATEMENT BULK INSERT TO STAGING - START -------------------------------------------------------------------------
--============================================================================================================================

exec msdb.dbo.rds_download_from_s3
      @s3_arn_of_file='arn:aws:s3:::financial-analytics-g5/income_statement.csv',
      @rds_file_path='D:\S3\income_statement.csv',
      @overwrite_file=1;

--EXEC msdb.dbo.rds_task_status


BULK INSERT  financial_analytics.staging.income_statement FROM 'D:\S3\income_statement.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW = 2,
    MAXERRORS = 0,
    BATCHSIZE = 50000,
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
	
    
);
--============================================================================================================================
---- INCOME STATEMENT BULK INSERT TO STAGING - END ---------------------------------------------------------------------------
--============================================================================================================================


------------------------------------------------------------------------------------------------------------------------------------------------



--============================================================================================================================
---- BALANCE SHEET BULK INSERT TO STAGING - START ----------------------------------------------------------------------------
--============================================================================================================================


exec msdb.dbo.rds_download_from_s3
      @s3_arn_of_file='arn:aws:s3:::financial-analytics-g5/balance_sheet.csv',
      @rds_file_path='D:\S3\balance_sheet.csv',
      @overwrite_file=1;


	  
EXEC msdb.dbo.rds_task_status

BULK INSERT  financial_analytics.staging.balance_sheet FROM 'D:\S3\balance_sheet.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW = 2,
    MAXERRORS = 0,
    BATCHSIZE = 50000,
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
	
    
);


--============================================================================================================================
---- BALANCE SHEET BULK INSERT TO STAGING - END ------------------------------------------------------------------------------
--============================================================================================================================


------------------------------------------------------------------------------------------------------------------------------------------------


--============================================================================================================================
---- CASH FLOW BULK INSERT TO STAGING - START --------------------------------------------------------------------------------
--============================================================================================================================

exec msdb.dbo.rds_download_from_s3
      @s3_arn_of_file='arn:aws:s3:::financial-analytics-g5/cash_flow.csv',
      @rds_file_path='d:\s3\cash_flow.csv',
      @overwrite_file=1;


	  
exec msdb.dbo.rds_task_status

bulk insert  financial_analytics.staging.cash_flow from 'd:\s3\cash_flow.csv'
with (
    format='csv',
    firstrow = 2,
    maxerrors = 0,
    batchsize = 50000,
	fieldterminator = ',',
    rowterminator = '\n'
	
    
);



--============================================================================================================================
---- CASH FLOW BULK INSERT TO STAGING - END ----------------------------------------------------------------------------------
--============================================================================================================================


------------------------------------------------------------------------------------------------------------------------------------------------


--============================================================================================================================
---- STOCK HISTORY TRANSFORMED INSERT TO DBO - START -------------------------------------------------------------------------
--============================================================================================================================

insert into financial_analytics.dbo.stock_price_history
select * from staging.vw_stock_price_history


--============================================================================================================================
---- STOCK HISTORY TRANSFORMED INSERT TO DBO - END ---------------------------------------------------------------------------
--============================================================================================================================


------------------------------------------------------------------------------------------------------------------------------------------------


--============================================================================================================================
---- INCOME STATEMENT TRANSFORMED INSERT TO DBO - START -------------------------------------------------------------------------
--============================================================================================================================
insert into dbo.income_statement
select * from staging.vw_income_statement;

--============================================================================================================================
---- BALANCE SHEET TRANSFORMED INSERT TO DBO - END ---------------------------------------------------------------------------
--============================================================================================================================

insert into dbo.balance_sheet
select * from staging.vw_balance_sheet;

--============================================================================================================================
---- CASH FLOW TRANSFORMED INSERT TO DBO - END ---------------------------------------------------------------------------
--============================================================================================================================

insert into dbo.cash_flow
select * from staging.vw_cash_flow;

