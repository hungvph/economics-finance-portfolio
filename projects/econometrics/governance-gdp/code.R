#clear all previous work from memory
rm(list=ls())
# Install Necessary Libraries
install.packages("readxl")
install.packages("dplyr")
install.packages("psych")
install.packages("stargazer")
# Load necessary libraries
library(readxl)
library(dplyr)
library(psych)
library(stargazer)
#specify the data path where you saved the data 
setwd("D:/dai hoc/Programming/R")
dir()
# Import the dataset from Excel
data <- read_excel("Sample_data_set_final .xlsx")
#view summary of your data
summary(data)
# Part 1.2: Data Importation:
# Select sample for analysis (region 5,6,7)
sample_data <- data %>%
  filter(region_wb %in% c(5, 6, 7))
# view the summary of the filtered data
summary(sample_data)
# Generate descriptive statistics
stats_table <- describe(sample_data)
# Select only required columns (mean, median, standard deviation, minimum, maximum, and number of observations)
selected_stats <- stats_table[, c("mean", "median", "sd", "min", "max", "n")]
# Format the data to display without scientific notation and round the numbers
descriptive_statistics<- apply(selected_stats, 2, function(x) ifelse(x == 0, '0', format(round(as.numeric(x), digits = 2), scientific = FALSE)))
# Convert back to a data frame
descriptive_statistics <- as.data.frame(descriptive_statistics)
# Display the table
print(descriptive_statistics)

# Create values for 15 variables to calculate the correlation
variables <- c("gdp_pcapita_ppp", "InnovationEfficiencyIndex", "NetNFDI", 
               "pop", "Total_natural_rent_GDP", "inflation", "healthspending", 
               "Lifeexpectancy", "developing", "gee", "vae", "pve", "rqe", 
               "rle", "cce")


# Calculate the correlation matrix
cor_matrix <- sample_data %>%
  select(all_of(variables)) %>%
  cor(use = "complete.obs")
# Format the data frame to display without scientific notation and round the numbers
cor_matrix <- apply(cor_matrix, 2, function(x) ifelse(x == 0, '0', format(round(as.numeric(x), digits = 2), scientific = FALSE)))
# Convert back to a data frame
cor_matrix <- as.data.frame(cor_matrix)
# Print the correlation matrix for 15 variables
print(cor_matrix)

#Part 2 and Part 3:
# Model 1: Simple linear regression
model_1 <- lm(gdp_pcapita_ppp ~ cce, sample_data)
summary(model_1)

# Model 2: Multiple linear regression
model_2 <- lm(gdp_pcapita_ppp~ cce + Total_natural_rent_GDP + NetNFDI, sample_data)
summary(model_2)

# Plot density (appendix 1)
plot(density(sample_data$gdp_pcapita_ppp), 
     main = "Density Plot of GDP per Capita", 
     xlab = "GDP per Capita", 
     ylab = "Density", 
     col = "blue", 
     lwd = 2
)

# Log transform the gdp_pcapita_ppp
sample_data$log_gdp_pcapita_ppp <- log(sample_data$gdp_pcapita_ppp)
# Plot density (appendix 2)
plot(density(sample_data$log_gdp_pcapita_ppp), 
     main = "Density Plot of log(GDP per Capita)", 
     xlab = "Log(GDP per Capita)", 
     ylab = "Density", 
     col = "blue", 
     lwd = 2
)

# Model 3: Revised model with potential adjustments
model_3 <- lm(log(gdp_pcapita_ppp) ~ cce + Total_natural_rent_GDP, sample_data)
summary(model_3)
# Compare 3 models
stargazer(model_1, model_2, model_3, type = "text")

#Part 4: Further Estimation
# Model 4: Interaction term and additional variables
model_4 <- lm(log(gdp_pcapita_ppp) ~ cce + Total_natural_rent_GDP + gee * developing+healthspending, sample_data)
summary(model_4)
# Compare preferred model to Model 4
stargazer(model_3, model_4, type = "text")

## Thank you for taking the time to read and review my code.♥♥♥