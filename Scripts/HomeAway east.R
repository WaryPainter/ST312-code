library(tidyverse)

# Binary coding for wins
East_Detailed$Binary <- ifelse(East_Detailed$`W/L` == "W", 1,0)
East_Advanced$Binary <- ifelse(East_Advanced$`W/L` == "W", 1,0)

# Creating home/away breakdown
eastbd <- East_Detailed %>%
  filter(X4 == "vs") %>%
  group_by(Team) %>%
  summarise(`Home Wins` = sum(Binary))

eastbd$`Home Losses` <- (41 - eastbd$`Home Wins`)
eastbd$`Home Win Rate` <- with(eastbd, `Home Wins` / (`Home Wins` + `Home Losses`))


eastaway <- East_Detailed %>%
  filter(X4 == "@") %>%
  group_by(Team) %>%
  summarise(`Away Wins` = sum(Binary))

eastbd$`Away Wins` <- eastaway$`Away Wins`
eastbd$`Away Losses` <- (41 - eastbd$`Away Wins`)
eastbd$`Away Win Rate` <- with(eastbd, `Away Wins` / (`Away Wins` + `Away Losses`))

View(eastbd)

