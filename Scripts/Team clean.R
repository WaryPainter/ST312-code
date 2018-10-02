givename <- function(dataset, fullname){
  dataset$Team <- rep(fullname)
  dataset <- dataset[,c(13, 1:12)]
}

