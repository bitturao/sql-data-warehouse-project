# 🏗️ Enterprise Sales Data Warehouse – Medallion Architecture
An end-to-end modern data warehouse implementation using **SQL Server** and **Medallion Architecture (Bronze → Silver → Gold)** to consolidate ERP and CRM data for advanced analytics and business reporting.

This project demonstrates practical expertise in **data engineering, ETL pipelines, dimensional modeling, data quality management, and SQL analytics**.

---

## 📌 Project Objectives

The goal of this project is to build a scalable and maintainable data warehouse that:

- Consolidates raw data from multiple source systems (ERP and CRM CSV files)
- Cleans, standardizes, and integrates data for analytics
- Implements dimensional modeling using a **Star Schema**
- Enables fast, reliable analytical reporting
- Follows modern data architecture best practices

---

## 🏛️ Architecture Overview

The project follows the **Medallion Architecture** pattern:

### 🥉 Bronze Layer – Raw Data
- Stores raw, unprocessed data as received from source systems
- Maintains traceability and supports debugging
- Load Method: Full Load (Truncate & Insert)
- Object Type: Tables
- Target Users: Data Engineers

---

### 🥈 Silver Layer – Cleaned & Standardized Data
- Cleans and standardizes raw data
- Handles normalization, deduplication, and enrichment
- Applies business-ready formatting and data validation
- Load Method: Full Load (Truncate & Insert)
- Object Type: Tables
- Target Users: Data Engineers & Data Analysts

---

### 🥇 Gold Layer – Business Ready Data
- Provides analytics-ready datasets
- Implements business logic and aggregations
- Uses dimensional modeling (Star Schema)
- Object Type: Views
- Target Users: Business Users & Analysts

---

## 🔄 ETL Pipeline Design

### Extraction
- Source Systems:
  - ERP CSV Files
  - CRM CSV Files
- Extraction Type: Full Extraction
- Technique: File Parsing

### Transformation
- Batch Processing
- Data Cleansing
- Standardization
- Normalization
- Derived Columns
- Data Enrichment
- Slowly Changing Dimension: **SCD Type 1**

### Load
- Full Load strategy using Truncate & Insert

---

## 📊 Data Modeling

The Gold layer uses a **Star Schema** design:

- **Fact Tables**
  - Sales Transactions
- **Dimension Tables**
  - Customers
  - Products
  - Dates
  - Regions
- Surrogate Keys for dimensional integrity
- Optimized for analytical query performance

---

## 📈 Analytics & Reporting

The warehouse enables SQL-based analytics for:

- 📊 Sales Trends Analysis
- 👥 Customer Behavior Insights
- 📦 Product Performance Evaluation
- 🌍 Regional Sales Distribution
- 📅 Time-based Growth Metrics

Sample metrics:
- Total Revenue
- Monthly Growth
- Top Customers
- Best-Selling Products
- Average Order Value

---

## 🗂️ Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
|
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
```
