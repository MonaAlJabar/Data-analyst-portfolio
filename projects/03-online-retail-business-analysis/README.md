# Online Retail Business Analysis (Python)

## Overview
This project analyzes the Online Retail II transaction dataset in Python to evaluate sales performance, product demand, and customer behavior. The analysis includes data cleaning, feature engineering, sales trend analysis, product analysis, customer revenue analysis, RFM segmentation, and Pareto revenue concentration analysis.

## Tools Used
- **Python**
- **Pandas**
- **Matplotlib**
- **Seaborn**
- **Jupyter Notebook**

## Dataset
The dataset contains retail transaction records with fields including:
- **Invoice**
- **StockCode**
- **Description**
- **Quantity**
- **InvoiceDate**
- **Price**
- **Customer ID**
- **Country**
  
  The dataset can be downloaded from the UCI Machine Learning Repository:
https://archive.ics.uci.edu/ml/datasets/online+retail+ii

## Features Created
- **Sales** = Quantity × Price
- **Year**
- **Month**
- **YearMonth**

## Questions Answered
- How does revenue change over time, and are there seasonal sales patterns?
- Which countries generate the most revenue?
- Which products generate the most revenue?
- Which products sell the most units, and how does that differ from revenue ranking?
- How many identifiable customers are in the valid sales dataset?
- Which customers generate the most revenue?
- How is customer value distributed across the customer base?
- Which customer segments appear most at risk based on RFM analysis?
- What percentage of customers generates 50%, 70%, 80%, and 90% of total revenue?

## Analysis Performed
- Data cleaning and transaction filtering
- Feature engineering for sales and time variables
- Revenue comparison before and after filtering
- Country-level sales analysis
- Product-level sales analysis
- Monthly revenue trend analysis
- Product quantity vs revenue comparison
- Customer revenue analysis
- RFM analysis and segmentation
- Pareto revenue concentration analysis

## Key Results
- Monthly revenue shows clear **seasonality**, with strong spikes toward the end of the year.
- Top products by **quantity sold** are not always the same as top products by **revenue generated**.
- The dataset contains **5,878 identifiable customers** after filtering to valid sales with customer IDs.
- Customer revenue is highly concentrated: approximately **23.02% of customers generate 80% of revenue**, while **4.41% generate 50% of revenue**.
- RFM analysis shows that the largest segment is **At Risk**, and this segment contributes the majority of customer revenue.

## Business Insights
- Revenue depends heavily on a relatively small portion of high-value customers.
- Customer retention is a major opportunity, especially for customers classified as **At Risk**.
- Product strategy should distinguish between **high-volume items** and **high-revenue items**.
- Seasonal demand patterns suggest the importance of planning inventory and promotions around year-end peaks.

## Files
- [`online_retail_analysis.ipynb`](online_retail_analysis.ipynb) — full notebook with data cleaning, analysis, visualizations, segmentation, and business recommendations

## How to Run
1. Open `online_retail_analysis.ipynb` in Jupyter Notebook or JupyterLab.
2. Make sure the dataset file is available in the expected location.
3. Run the notebook from top to bottom to reproduce the full analysis.
