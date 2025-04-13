pokedex <- read.csv("./Zavlanis-Data/pokedex.csv")
str(pokedex)
pokedex <- pokedex[, -1]
rownames(pokedex) <- pokedex$Name
pokedex <- pokedex[, -which(names(pokedex) == "Name")]
pokedex <- pokedex[, -2]
OmastarInfo <- pokedex["Omastar", ]
print(OmastarInfo)

num_noType2 <- sum(pokedex$Type.2 == "")
print(num_noType2)
slowPokemon <- sum(pokedex$Speed < 60)
print(slowPokemon)

print(round(mean(subset(pokedex$Attack, pokedex$Type.1 == "Water" | pokedex$Type.2 == "Water")), 3))
FairyPokemon <- pokedex[pokedex$Type.1 == "Fairy" | pokedex$Type.2 == "Fairy", ]
fairyWithMaxHP <- rownames(FairyPokemon)[which.max(FairyPokemon$HP)]
print(fairyWithMaxHP)

pokedex$NormHp <- (pokedex$HP - min(pokedex$HP)) / (max(pokedex$HP) - min(pokedex$HP))
pokedex$NormAttack <- (pokedex$Attack - min(pokedex$Attack)) / (max(pokedex$Attack) - min(pokedex$Attack))
pokedex$NormDefense <- (pokedex$Defense - min(pokedex$Defense)) / (max(pokedex$Defense) - min(pokedex$Defense))
orderedByHPNorm<-order(pokedex$NormHp, decreasing = TRUE)
head(pokedex[orderedByHPNorm, ],3)
median_value <- round(median(pokedex$NormAttack), 3)
print(median_value)
average_value <- round(mean(pokedex$NormDefense), 3)
print(average_value)

pokedex$Performance <- pokedex$NormHp*pokedex$NormAttack*pokedex$NormDefense
pokedex$Grade <- cut(pokedex$Performance, breaks = c(0.0002, 0.15, 0.2, 1), labels = c("Weak", "Normal", "Strong"))
numberStrongPokemon <- nrow(pokedex[pokedex$Grade == "Strong", ])
print(numberStrongPokemon)
HaunterGrade <- pokedex["Haunter", "Grade"]
print(HaunterGrade)
