studentData <- read.csv("./Zavlanis-Data/StudentPerformanceFactors.csv")
str(StudentData)
print(names(StudentData)[sapply(StudentData, is.numeric)])

StudentDataNumeric <- StudentData[, sapply(StudentData, is.numeric)]

corMatrix <- cor(StudentDataNumeric)
print(corMatrix)
heatmap(corMatrix, symm = TRUE, Rowv = NA)

round(corMatrix["Attendance", "Hours_studied"], 3)
round(corMatrix["Attendance", "Exam_Score"], 3)
round(corMatrix["Tutoring_Sessions", "Previous_Scores"], 3)
round(corMatrix["Physical_Activity", "Sleep_Hours"], 3)
