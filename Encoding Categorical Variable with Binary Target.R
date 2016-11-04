# Author: Pradeep J

# This function computes the ratio of 1's to total no of 1's and 0's in the target variable per level of a given
# categorical variable. 'dplyr' package is required to be loaded before using the function



# data= dataframe being used
# catvar = categorical variable for which ratio to be computed
# target variable (binary)

cat_encoding = function(data, catvar, target)
{
  outcomes <- data %>% group_by(as.factor(data[,catvar]), as.factor(data[,target])) %>% summarise (num_cust = n())
  
  colnames(outcomes) <- c(catvar,target,"Count")
  
  # Computing ratio of 1's to no of 1's+0's in our target variable by each level of variable veh_body
  
  outcomes2 = aggregate(outcomes[["Count"]], by=list(Category=outcomes[[catvar]]), FUN=sum)
  colnames(outcomes2) = c(catvar, 'no_of_zero_and_ones')
  outcomes3 = subset(outcomes, outcomes[,target] == 1)
  outcomes3 = left_join(outcomes3,outcomes2,by = catvar)
  outcomes3$ratio = outcomes3$Count/outcomes3$no_of_zero_and_ones
  outcomes3 = subset(outcomes3, select=c(catvar, "ratio"))
  
  #putting everything together
  data = left_join(data,outcomes3,by = catvar)
  
  return(data)
}