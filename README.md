# 📄Overview:
## Creating the table:
#### 1. Saving dataset from [Kaggle](https://www.kaggle.com/)
#### 2. Creating table properties for the dataset
#### 3. Importing data through DBeaver built-in tool
## Getting unoptimized query:
#### 1. Generating query with ChatGPT-4o
#### [Query.sql](query_versions/original_query.sql)
#### [Execution plan](execution_plans/original_querry.md)
## Optimization steps:
### Step 1:
#### 1. Making common table expressions (CTE) for each subselect
#### 2. Joining CTEs to the primary table
#### [Query.sql](query_versions/step1_refactor.sql)
#### [Execution plan](execution_plans/step1_refactor.md)
### Step 2:
#### 1. Creating index on  <span style="color: #058743;">bike_model</span> column
#### 2. Creating composite index on <span style="color: #058743;">customer_id</span> and <span style="color: #058743;">sales_date</span> column
#### [Query.sql](query_versions/step2_indexing.sql)
#### [Execution plan](execution_plans/step2_indexing.md)
## [Explanation of optimization](explanations/explanation.md)
