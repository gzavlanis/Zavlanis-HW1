# Topic 2: Tabular and Graphical Representations

# a.
# Start by read the file and print an overview of it
data <- read.csv("./Zavlanis-Data/Disease_symptom_and_patient_profile_dataset.csv")
print(str(data))
print(head(data))

# Use the nrow to count the rows of the dataset
print("Length of the Dataset:")
print(nrow(data))

# I used function sapply in order to iterate inside data and find numeric attibutes with is.numeric condition.
# Function sum summarize the results at the same time and find how these attributes are.
numeric_attr <- sum(sapply(data, is.numeric))
print("Number of numeric attributes:")
print(numeric_attr)

# Indexing at the third row of data and write the name of the attribute Desease in order to take its value.
print("The value of the attribute 'Disease' of the 3rd record:")
print(data[3, "Disease"])

# b.
# Create the contigency table using the function table() and the attributes we want
table <- table(data$Fever, data$Cough)

# Add sums using the function addmargins() in previous table
table <- addmargins(table)
print("Contigency table of absolute frequencies for Fever and Cough:")
print(table)

# c.
# First, collect the data we want, the Fatigue attribute in a table using table() function.
fatigue_table <- table(data$Fatigue)
print(fatigue_table)

# Create the barplot of the previous table and save it in a jpeg file.
jpeg("./Zavlanis-Plots/barplot.jpeg", width = 1000, height = 800, units = "px")
barplot(
    fatigue_table,
    main = "Frequency of Fatigue symptoms among patients",
    xlab = "Existence vs Absence",
    ylab = "Fatigue",
    col = rainbow(length(fatigue_table)),
    cex.main = 2,
    cex.axis = 2,
    cex.lab = 2
)
dev.off()

# d.
# Collect data about cholesterol with the suitable attribute into a table using function table().
cholesterol_table <- table(data$Cholesterol.Level)
print(cholesterol_table)

# Create the pie chart of the previous table and save it into a jpeg file.
jpeg("./Zavlanis-Plots/piechart.jpeg", width = 800, height = 800, units = "px")
pie(
    cholesterol_table,
    main = "Distribution of cholesterol levels among patients",
    col = rainbow(length(cholesterol_table)),
    cex.main = 2,
    cex.axis = 2,
    cex.lab = 2
)
dev.off()

# e.
# Create the boxplot of the Age distribution of Patients with different diseases and save it into a jpeg file.
jpeg("./Zavlanis-Plots/boxplot.jpeg", width = 3000, height = 1080, units = "px")
boxplot(
    data$Age ~ data$Disease,
    data = data,
    main = "Distribution of age of patents with different diseases",
    xlab = "Disease",
    ylab = "Age",
    cex.main = 2,
    cex.lab = 2
)
dev.off()

source("Zavlanis-Topic2.R", echo = TRUE)
