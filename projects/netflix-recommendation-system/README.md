# Netflix Recommendation System

## Project Type

Machine Learning | Recommender Systems | Large-Scale Rating Data

## Business Problem

Streaming platforms need a scalable way to understand user preferences and recommend relevant content from historical rating behavior.

## Objective

Develop a recommendation workflow from user-movie interactions and evaluate collaborative filtering quality.

## Dataset and Preparation

- Started from raw ratings data with customer rows and embedded movie identifiers
- Parsed movie IDs from the source format and created a usable analytical structure
- Built a cleaned dataset with:
  - `Cust_id`
  - `Rating`
  - `Movie_ID`

## Workflow

- Measured movie count, customer count, and rating count
- Analyzed rating distributions and data quality
- Converted the dataset into a collaborative filtering format
- Built a recommendation model using the Surprise library
- Applied matrix factorization with `SVD`
- Evaluated performance with cross-validation and `RMSE`

## Tools and Libraries

- Python
- NumPy
- Pandas
- Matplotlib
- Seaborn
- scikit-surprise

## Skills Demonstrated

- Data cleaning for recommender systems
- Transformation of semi-structured rating data
- User-item modeling
- Collaborative filtering
- Quantitative model validation

## Deliverable

- `Rahul_Netflix.ipynb`

## Outcome

Demonstrates an end-to-end recommender system workflow from data preparation to quantitative validation.
