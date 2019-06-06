#'--- 
#' title: "Using plumber to launch an API"
#' author: "Nayef Ahmad"
#' date: "2019-06-05"
#' output: html_document
#' ---
#' 
#' Reference: https://resources.rstudio.com/webinars/plumber-api-final 
#' 
#' 
#' \  
#' 
#' ### Quickstart guide: 

#' * Step 1: Write a function that accepts 0 or more arguments. Here, the
#' function is saved in the file `plumber_function.R`. Do not assign the
#' function to a function name.
  
#' * Step 2: Write an R script that loads `plumber` package and passes the name
#' of the function file to the `plumb()` function

#' * Step 3: Run `pr$run(port = 8000)` to test the function on `localhost`

#' * Step 4: In your browser, try this: `localhost:8000/echo?msg="test
#' message"`. Note that "echo" is the endpoint that we specified in the function
#' definition. We could change it to something else. Arguments are preceded by
#' question marks.


#+ plumber, eval=FALSE 
library(plumber)
pr <- plumb(here::here("src", 
                       "plumber_function.R"))
pr$run(port = 8000)


#' \  
#' 
#' ### Let's try with another function: 
#' 

#+ random, eval=FALSE 
pr2 <- plumb(here::here("src", 
                        "random_plumber-function.R"))
pr2$run(port = 8000)

#+ 
#' Now try `http://localhost:8000/random?number=42`
#' 
#' ### Todo: 
#' 
#' Why is this just returning the argument to me instead of returning a 
#' random number?