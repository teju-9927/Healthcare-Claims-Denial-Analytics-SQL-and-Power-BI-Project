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

