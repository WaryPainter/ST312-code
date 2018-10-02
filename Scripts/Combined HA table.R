# Combine west and east home/away tables
hatotal <- rbind(westbd, eastbd)
View(hatotal)

# Create columns with totals
hatotal$`Total Wins` <- with(hatotal, `Home Wins` + `Away Wins`)
hatotal$`Total Losses` <- (82 - hatotal$`Total Wins`)
hatotal$`Total Win Rate` <- with(hatotal, `Total Wins` / (`Total Wins` + `Total Losses`))
hatotal$HAdiff <- hatotal$`Home Win Rate` - hatotal$`Away Win Rate`


# experimental analysis
with(hatotal, plot(`Total Win Rate`, HAdiff))
reg <- lm(HAdiff ~ `Total Win Rate`, hatotal)
summary(reg)
abline(reg)
