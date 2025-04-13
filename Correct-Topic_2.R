symptoms_data <- read.csv("./Zavlanis-Data/Disease_symptom_and_patient_profile_dataset.csv")
str(symptoms_data)

addmargins(table(symptoms_data$Fever, symptoms_data$Cough, dnn = c("Fever", "Cough")))

fatigue_freq = table(symptoms_data$Fatigue)
barplot(fatigue_freq, main = "Symptom Frequency", xlab = "Fatigue", ylab = "Frequency", col = "skyblue")

cholesterol_freq = table(symptoms_data$Cholesterol.Level)
pie(cholesterol_freq, main = "Pie Chart of Cholesterol level attribute", col = c("blue", "lightgreen", "red"))

boxplot(Age ~ Disease, data = symptoms_data, main = "Age Distribution by Disease", xlab = "Disease", ylab = "Age", cex.axis = 0.7, col = "lightblue", las = 2)

boxplot(Age ~ Disease, data = symptoms_data[symptoms_data$Disease == "Typhoid Fever", ], main = "Age Distribution by Disease", xlab = "Disease", ylab = "Age")
