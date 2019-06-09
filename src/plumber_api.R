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

#' * Step 1: Write a function that accepts 0 or more arguments. Here, there are
#' functions saved in the files `plumber_function.R`,
#' `random_plumber-function.R`, and `iris-regression_function.R`. Do not assign
#' the API function to a function name. This function can come at the end of an
#' analysis R script, using objects defined in that script.
  
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
library(plumber)
pr2 <- plumb(here::here("src", 
                        "random_plumber-function.R"))
pr2$run(port = 8000)

#+ 
#' Now try this in browser: `localhost:8000/random?number=42`
#' 
#' 
#' \  


#' \
#'
#' ### Let's try with a more complex function, with data from an R script: 
#' 

#+ plumber-iris, eval=FALSE 
library(plumber)
pr3 <- plumb(here::here("src", 
                        "iris-regression_function.R"))
pr3$run(port = 8000)

#+ 
#' Now try this in browser: `localhost:8000/iris?petal_width=1`
#' 
#' 
#' \  











#' \  
#' \  

#' 
#' ### Deploying on Digital Ocean droplet (todo:): 
#' 
#+ droplet, eval=FALSE 
library(analogsea)  # interface to Digital Ocean 
account()

# Note that if you want to connect over SSH to a droplet you have to create the
# droplet with an SSH key with the ssh_keys parameter.
droplet_create(region = "sfo2")

# Waiting for create ....................
# <droplet>ConvexAcreage (146587197)
# IP:        159.89.139.44
# Status:    new
# Region:    San Francisco 2
# Image:     14.04.5 x64
# Size:      512mb
# Volumes: 

keys()

do_provision(droplet = "ConvexAcreage", 
             region = "sfo2", 
             ssh_keys = "24775763")

