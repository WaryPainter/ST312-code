library(tidyverse)
east <- Eastern_Conference

# Cleanup
east$Notes <- NULL
east$Dates <- as.Date(east$Date, format = "%a %b %d %Y")
east$X3[is.na(east$X3)] <- "vs"
east$Binary <- ifelse(east$X5 == "W", 1, 0)

# Separating home and away
easthome <- subset(east, X3 =="vs")
eastaway <- subset(east, X3 == "@")

# Creating team tables (with dplyr)
EastHomeWinRate <- easthome %>%
                    group_by(Team) %>%
                    summarise(Total = n(), WinRate = mean(Binary))

EastAwayWinRate <- eastaway %>%
                    group_by(Team) %>%
                    summarise(Total = n(), WinRate = mean(Binary))

# Exporting
write.csv(EastHomeWinRate, "East Home Win Rate.csv")
write.csv(EastAwayWinRate, "East Away Win Rate.csv")