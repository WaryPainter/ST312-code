library(readr)

importeast <- function(team){
  read_csv(paste("I://Documents/NBA projects/ST312/2017/East/", deparse(substitute(team)), ".txt", sep = ""))
}
