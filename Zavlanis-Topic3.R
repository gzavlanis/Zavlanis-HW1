# Topic 3: Correlation

# a.
# Read the CSV file and print an overview of data
StudentData <- read.csv("./Zavlanis-Data/StudentPerformanceFactors.csv")
print(str(StudentData))

# Find the number of rows in the dataset using nrow() function.
print("Length of the Dataset:")
print(nrow(StudentData))

# Find how many different attributes exist, using the length of the list created by attributes() function,
# which returns the attributes names.
print("Number of different attributes:")
print(length(attributes(StudentData)$names))

# Iterate inside the dataset using function sapply() in order to find the numeric attributes,
# use the result as index and then using the function names() get the names of them.
print("Names of numeric attributes:")
print(names(StudentData)[sapply(StudentData, is.numeric)])

# b.
# Using sapply again inside indexing to get all numeric attributes and create a new dataframe only with them.
StudentDataNumeric <- StudentData[sapply(StudentData, is.numeric)]
print("Numeric Attributes of the Dataset:")
print(head(StudentDataNumeric))

# c.
# Create the correlation matrix using function cor() with pearson as method and round all values
#in three decimals
correlation_matrix <- round(cor(StudentDataNumeric, method = "pearson"), 3)
print("The correlation matrix:")
print(correlation_matrix)

# Create the heatmap of the correlation matrix and save it in a jpeg file.
jpeg("./Zavlanis-Plots/heatmap.jpeg", width = 800, height = 1000, units = "px")
heatmap(
    main = "Heatmap of the correlation matrix",
    correlation_matrix,
    Rowv = NA,
    Colv = NA
)
dev.off()

# d.
# Print specific value pairs of the previous correlation matrix using indexing.
print(correlation_matrix["Attendance", "Hours_Studied"])
print(correlation_matrix["Attendance", "Exam_Score"])
print(correlation_matrix["Tutoring_Sessions", "Previous_Scores"])
print(correlation_matrix["Physical_Activity", "Sleep_Hours"])

# e.
# Get this value in order to answer the question.
print("Correlation value:")
print(correlation_matrix["Exam_Score", "Hours_Studied"])

source("Zavlanis-Topic3.R", echo = TRUE)
