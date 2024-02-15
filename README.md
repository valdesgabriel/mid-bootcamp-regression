# Ironhack Mid-Bootcamp Project: 
## Housing Regression Problem


### Objective:
Create a machine learning model using the provided data set of houses sold in Washington state in 2014 and 2015. The data includes columns various properties of the houses that is used to describe each house, including number of bedrooms, bathrooms, square footage and more. 

### Repository Contents:
- **MySQL** : SQL Queries/Deliverables
- **Project Details and Deliverables** : Markdown files with project details and instructions
- **Python Notebooks and Data Files** : Jupiter notebook files and housing data
- **Tableau Workbook** : Dashboard and various visuals created using Tableau. 
    - Also available at this link: https://public.tableau.com/app/profile/gabriel.valdes/viz/RegressionViz/Dashboard1#1
    
## Machine Learning Overview:
- The data was imported, and using some EDA techniques, I determined what I needed to clean. My primary goal was to reduce they amount of individual categories within the categorical features by using data extraction and other techniques including a few maps, and pd.qcut application. 
- For the numerical data, I first checked the distribution of each column; using a for-loop to visualize the numerical columns, I observed significant skewedness and long tails, which is a signifier of outliers in the data. To fix the distributions of the numerical data I successfully used a log transformation. After dropping the necessary columns, I moved on to the pre-processing part of the process. 
- I decided I would try 3 different techniques to scale the numerical data: MinMax Scaler, Standard Scaler and the Normalizer. I encoded the categorical data using OneHotEnconder. 
- One of the machine learning models I was planning to use was K-Nearest Neighbors, so I proceeded to determine what the best value for K, for which I used a RMSE vs. Complexity graph. 
- I then built a function to simultaneously fit and transform the test and training data to each ML model I was using: Linear Regression, KNN and MLP Regressor. The function also provided me with the 3 types of accuracry score based on prediction made by the models: R2 Score, Root Mean Square Deviation and Mean Absolute Error. 
- The model and scaler combination that gave the best result was the **MinMax Scaler and the MLP Regressor**.
- I then tested the assumptions of my models by doing a homoscedasticity test and plotting a normality of error graph, both of which showed good results.

Thank you for reading my README! Have a great day!