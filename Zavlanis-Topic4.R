# Topic 4: Data Frames

# a.
# Read the csv file and print an overview of it
pokedex <- read.csv("./Zavlanis-Data/pokedex.csv")
print(str(pokedex))

pokedex <- subset(pokedex, select = -Image) # Remove Image attribute
row.names(pokedex) <- pokedex$Name # Name the rows based on Attribute name
pokedex <- subset(pokedex, select = -Name) # Remove attribute Name

# Print an overview of the new Data frame
print("Final dataframe:")
print(str(pokedex))

View(pokedex[row.names(pokedex) == "Omastar", ]) # View the row with the name Omastar.

# b.
# Count the rows where the Type.2 attribute is Na, using condition inside index.
print("Number of pokemon that don't have second type:")
print(nrow(pokedex[is.na(pokedex$Type.2)]))

# Again using indexing with condition we count the rows, using nrows(), where speed attribute is less than 60
print("Number of pokemon whose speed is less than 60:")
print(nrow(pokedex[pokedex$Speed < 60, ]))

# c.
# Indexing with double condition in order to collect water-type Pokemon. Type.1 OR Type.2 must be equals to "Water".
watertype_pokemon <- pokedex[(pokedex$Type.1 == "Water") | (pokedex$Type.2 == "Water"), ]
print("Average of attack of water type pokemon:")

# Calculate the mean value of average of the Attack attribute of water-type Pokemon
print(round(mean(watertype_pokemon$Attack), 3)) 

# With the same way as previously we filter the data frame to get the Pokemon with Type.1 or Type.2 equals with "Fairy"
fairytype_pokemon <- pokedex[(pokedex$Type.1 == "Fairy") | (pokedex$Type.2 == "Fairy"), ]

# Use the which.max condition inside index to get the Pokemon with the greatest HP value and keep only the row name.
print("Pokemon with the greatest HP value:")
print(row.names(fairytype_pokemon[which.max(fairytype_pokemon$HP), ]))

# d.
# Function to calculate the min max norm rounded in 3 decimals
min_max_norm <- function(x) {
    round((x - min(x)) / (max(x) - min(x)), 3)
}

# Use the function to create three new attributes by calculating the norm of HP,Attack and Defense
pokedex$NormHP <- min_max_norm(pokedex$HP)
pokedex$NormAttack <- min_max_norm(pokedex$Attack)
pokedex$NormDefense <- min_max_norm(pokedex$Defense)

print(head(pokedex)) # print some rows of the new Dataframe

# Sort the Data frame by the NormHP value in decreasing order and print the first three Pokemon names
pokedex_ordered_by_normhp <- pokedex[order(pokedex$NormHP, decreasing = TRUE), ]
print("Top 3 highest NormHP Pokemon:")
print(row.names(pokedex_ordered_by_hormhp[1:3, ]))

# Calculate the Median of the NormAttack attribute using median() function
print("Median value of the NormAttack attribute:")
print(median(pokedex$NormAttack))

# Calculate the mean value of attribute NormDefense using mean()
print("Average value of the NormDefense attribute:")
print(mean(pokedex$NormDefense))

# e.
# Calculate the new attribute according to the formula
pokedex$Performance <- round((pokedex$NormHP * pokedex$NormAttack * pokedex$NormDefense) + 0.0002, 3)

# Create the attribute Grade based of range of values of Performance attribute
# We use ifelse() in order to cover all four cases
pokedex$Grade <- with(
    pokedex, ifelse(
        Performance > 0 & Performance <= 0.15, "Weak",
        ifelse(
            Performance > 0.15 & Performance <= 0.2, "Normal", "Strong"
        )
    )
)

# Write the new Data frame in a new csv file
print(head(pokedex))
write.csv(pokedex, "./Zavlanis-Data/new_pokedex.csv")

# Show the number of the Rows with Grade attribute = "Strong" using nrow() and condition inside index
print("Number of Pokemon with strong grade:")
print(nrow(pokedex[pokedex$Grade == "Strong", ]))

# Show the Grade of a Pokemon with specific name, using again the condition inside the index 
print("Grade of Pokemon named 'Haunter':")
print(pokedex["Haunter", "Grade"])

source("Zavlanis-Topic4.R", echo = TRUE)
