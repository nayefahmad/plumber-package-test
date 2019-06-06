
library(plumber)
pr <- plumb(here::here("src", 
                       "plumber_function.R"))
pr$run(port = 8000)
