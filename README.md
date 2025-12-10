# Healthcare-Claims-Denial-Analytics-SQL-and-Power-BI-Project
SQL was used to clean and analyze the data, define KPIs, and identify denial patterns, loss, and provider risk. Power BI visualizes these insights through a 4-page interactive dashboard covering Overview, Financial Impact, Denial Analysis, and Patient Breakdown


1.Dataset Collection
This project uses synthetic healthcare claims data, modeled to resemble real CMS (Centers for Medicare & Medicaid Services) datasets.
The data includes:
•	claims → claim_type, billed_amount, paid_amount, denial_flag, denial_reason
•	patients → demographics + chronic condition flags
•	providers → provider info + location.


2. SQL Workbench Analysis (Backend)
SQL served as the analytical backend to validate, clean, and understand the dataset before visualization.

2.1 Schema Creation
Three relational tables were created:
•	patients (dimension)
•	providers (dimension)
•	claims (fact table)
Relationships:
•	claims.patient_id → patients.patient_id
•	claims.provider_id → providers.provider_id

2.2 Data Loading
All CSV files were imported into SQL Workbench using standard load commands.

2.3 Data Validation
To ensure clean and accurate modeling, the following checks were performed:
•	Missing values
•	Duplicate claim IDs
•	Invalid dates
•	Numeric type consistency
•	Chronic condition flags = 0/1
•	Referential integrity across patient/provider IDs

2.4 Exploratory Analysis in SQL
SQL queries were used to understand the data and define key metrics:
•	Total claims, denied claims
•	Denial rate
•	Monthly denial trends
•	Loss calculations (gross + net)
•	Denial reasons distribution
•	Provider-level denial risk
•	Chronic conditions impact
•	Geographic distribution
This analytical work defined the KPIs and visuals later used in Power BI.


3. Power BI Dashboard (Frontend Visualization)
Power BI transformed SQL insights into an interactive 4-page executive dashboard.

PAGE 1 — Overview Dashboard
Purpose:
Provide a quick executive summary of claim volume, performance, and denial patterns.
Visuals:
KPI Cards (Total Claims, Denied Claims, Paid Amount, Billed Amount, Payment Rate)
Payment Rate by Claim Type (Bar Chart)
Denial Rate by Claim Type (Bar Chart)
Monthly Denial Trend (Line Chart)
Denial Rate by State (Map)
Insight Box (“High denial variation across claim types & states.”)

PAGE 2 — Financial Impact Analysis
Purpose:
Highlight revenue leakage and pinpoint high-loss denial reasons.
Visuals:
Waterfall Chart → Billed → Paid → Denial Loss → Net Revenue
Decomposition Tree → Root cause breakdown (claim_type, denial_reason, provider, state)
Pareto Chart → 80% of gross loss caused by top denial reasons
Bar Chart → Gross vs Net Denial Loss
Financial Insight Box

PAGE 3 — Denial Analysis (Behavior Patterns)
Purpose:
Explore denial behaviors across multiple angles.
Visuals:
Donut Chart → Denial Loss by Denial Reason
Bar Chart → Denial Loss by Claim Type
Monthly Loss Trend (Line/Area Chart)
Provider Risk (Top 10 providers with highest denial rate)

PAGE 4 — Patient & Claims Breakdown
Purpose:
Understand how demographics and chronic conditions influence claims.
Visuals:
Pie Chart → Claim Type Distribution
Pie Chart → Gender Distribution
Filled Map → Total Claims by State
Bar Chart → Chronic Conditions (Diabetes, CHF, CKD, COPD, ESRD)
Patient Conditions Summary Table

 4. End-to-End Workflow Summary

SQL was my analytical backend: I created the schema, loaded the data, performed validation checks, and wrote analytical queries to identify denial patterns, financial loss, provider risk, and patient condition trends.
Power BI was my visualization frontend: I used the results of my SQL analysis to model the data and build a 4-page interactive dashboard featuring KPIs, Pareto charts, waterfall analysis, maps, and a decomposition tree.

Together, SQL and Power BI form a complete end-to-end healthcare analytics workflow.

Purpose
This project is purely for educational and analytical purposes.
No real patient data was used, and no personal or confidential information is included.

Developed By
Tejaswi.v
Master’s Student | Healthcare informatics

