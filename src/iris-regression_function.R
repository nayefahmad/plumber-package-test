
# define some data: 
library(dplyr)

df1.iris_modified <- 
  iris %>% 
  filter(Sepal.Length > 5.8)
  
m1 <- lm(Sepal.Length ~ Petal.Width, 
         data = df1.iris_modified)  

# summary(m1)

# test model: 
# predict(m1, 
#         newdata = data.frame(Petal.Width = 1))  # 6.118112 


#* @get /iris
function(petal_width){
  # convert the input to a number
  petal_width <- as.numeric(petal_width)
  
  #create the prediction data frame
  prediction_data <- data.frame(Petal.Width = petal_width)
  
  # create the prediction
  predict(m1,
          prediction_data)
}

