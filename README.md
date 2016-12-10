# Encoding-Categorical-Variables

A python and R script is attached for encoding categorical variables with high cardinality. We basically compute the mean and std dev for each level of a given
categorical variable based on target variable (if target is continuous). If target is binary, we compute the ratio of 1's and 0's for each level of 
given categorical variable. Thus the transformed numeric version of the categorical variables can be used directly in modeling
