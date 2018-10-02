library(tidyverse)

# Binary coding for wins
West_Detailed$Binary <- ifelse(West_Detailed$`W/L` == "W", 1,0)
West_Advanced$Binary <- ifelse(West_Advanced$`W/L` == "W", 1,0)

# Creating home/away breakdown
westbd <- West_Detailed %>%
            filter(X4 == "vs") %>%
              group_by(Team) %>%
                summarise(`Home Wins` = sum(Binary))

westbd$`Home Losses` <- (41 - westbd$`Home Wins`)
westbd$`Home Win Rate` <- with(westbd, `Home Wins` / (`Home Wins` + `Home Losses`))


westaway <- West_Detailed %>%
                      filter(X4 == "@") %>%
                        group_by(Team) %>%
                        summarise(`Away Wins` = sum(Binary))

westbd$`Away Wins` <- westaway$`Away Wins`
westbd$`Away Losses` <- (41 - westbd$`Away Wins`)
westbd$`Away Win Rate` <- with(westbd, `Away Wins` / (`Away Wins` + `Away Losses`))

View(westbd)

                        