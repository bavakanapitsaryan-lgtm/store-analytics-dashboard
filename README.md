# Store Analytics Dashboard (SQL + Tableau)

This project analyzes retail store performance using SQL for data transformation and Tableau for interactive visualization.  
The goal is to turn raw operational data into actionable business insights covering **customers**, **products**, and **HR performance** — all in one integrated dashboard.

---

## Project Overview
The project focuses on a fictional retail store dataset, analyzed in three key areas:

1. **Customer Metrics** – purchasing behavior, daily order trends, and demographic patterns.  
2. **Product Metrics** – product line performance and sales trends.  
3. **HR Metrics** – employee and office performance insights.

All these insights are brought together into a **single Tableau dashboard**:  
**[Store Analytics Dashboard](https://public.tableau.com/app/profile/bav.api/vizzes)**

---

##  Tools & Technologies
- SQL (DDL + queries)
- Tableau Public (Dashboard visualization)
- CSV (Raw & processed datasets)
- Basic ETL structure with SQL-to-Tableau pipeline

---

## Requirements

- SQL environment (PostgreSQL 13+)
- Tableau Public (latest version)
- CSV files from the `raw_data/` folder
- Any SQL client (e.g., DBeaver, MySQL Workbench, or pgAdmin)  
  *(Project developed using DBeaver, but any client works.)*


---

## Workflow
1. **Data Preparation**
   - Structured raw CSV data using `Store_ddl.sql`.
   - Executed SQL queries for each metrics area to transform and aggregate data.

2. **Analysis**
   - `1_customer_metrics.sql` → customer orders, demographics, daily trends  
   - `2_product_metrics.sql` → product performance, product line analysis  
   - `3_hr_metrics.sql` → employee and office performance

3. **Visualization**
   - Combined all metrics into a single Tableau workbook: **Store Analytics Dashboard**.
   - Created interactive filters for time, region, and product categories.

---

## Key Insights
- **Customer:** Clear daily order trends and demographic purchasing behavior.  
- **Product:** Top-performing product lines and seasonal sales spikes identified.  
- **HR:** High-performing employees and offices driving revenue growth.

These insights support better marketing strategies, inventory planning, and workforce optimization.

---

## Project Structure


---

##  Dashboard
- **[Store Analytics Dashboard](https://public.tableau.com/app/profile/bav.api/vizzes)** 

The dashboard provides:
-  Real-time trend analysis  
-  Interactive filters and drilldowns  
-  Key business KPIs

---

## Author
**[Your Name]**  
Data Analyst | SQL & Tableau Enthusiast  
- [LinkedIn](https://www.linkedin.com/in/bavakan-apitsaryan-880b3011a/)  
- [GitHub](https://github.com/bavakanapitsaryan-lgtm)  
- [Tableau Public](https://public.tableau.com/app/profile/bav.api)

---

## How to Use
1. Run `Store_ddl.sql` to create the database structure.  
2. Execute queries in the `queries` folder to generate datasets.  
3. Open `Store Analytics Dashboard.twbx` in Tableau.  
4. Interact with the dashboard to explore KPIs and insights.

---

## 📝 License
This project is for educational and portfolio purposes.
