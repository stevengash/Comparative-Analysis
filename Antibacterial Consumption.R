# Load required packages
library(readxl)

# Read in the data from the Excel file
data <- read_xlsx("Annex_1_ESAC-Net_report_2020_downloadable_tables.xlsx", 
                  sheet=8,skip=3,col_types=c('text',rep('numeric',11)),n_max=27)
# Rename the columns
colnames(w8) <- c("Country", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L")

# Calculate mean, standard deviation, and median for columns B-F and K-L
data_stats <- data.frame(
  Country = w8$Country,
  Mean = apply(w8[, 2:6], 1, mean),
  SD = apply(w8[, 11:12], 1, mean),
  Median = apply(w8[, 2:6], 1, median)
)


# Find the country with the highest consumption (highest mean/median from columns B-F)
max_consumption <- data_stats[which.max(data_stats$Mean), ]

# Find the country with the lowest sd (lowest mean from columns K-L)
min_sd <- data_stats[which.min(data_stats$SD), ]

# Print the results
cat("Country with highest consumption: ", max_consumption$Country, "\n")
cat("Descriptive statistics for highest consumption: \n")
cat("Mean: ", max_consumption$Mean, "\n")
cat("Standard deviation: ", max_consumption$SD, "\n")
cat("Median: ", max_consumption$Median, "\n\n")
cat("Country with lowest sd: ", min_sd$Country, "\n")
cat("Descriptive statistics for lowest sd: \n")
cat("Mean: ", min_sd$Mean, "\n")
cat("Standard deviation: ", min_sd$SD, "\n")
cat("Median: ", min_sd$Median, "\n")



#2

greece <- w8[w8$Country == "Greece", 2:6]
bulgaria <- w8[w8$Country == "Bulgaria", 2:6]

t_test <- t.test(greece, bulgaria, var.equal = TRUE)

cat("Hypotheses tested: The null hypothesis is that there is no difference between the mean antibacterial consumption of the two countries. The alternative hypothesis is that there is a difference between the mean antibacterial consumption of the two countries.\n")
cat("Test statistic: ", t_test$statistic, "\n")
cat("P-value: ", t_test$p.value, "\n")
cat("95% Confidence interval: [", t_test$conf.int[1], ", ", t_test$conf.int[2], "]\n")


if (t_test$p.value < 0.05) {
  cat("Decision: We reject the null hypothesis. There is a significant difference between the mean antibacterial consumption of the two countries.\n")
} else {
  cat("Decision: We fail to reject the null hypothesis. There is no significant difference between the mean antibacterial consumption of the two countries.\n")
}


# 3. Use a non-parametric test to compare antibacterial consumption of the two countries.
# Subset the data for the two countries of interest
library(dplyr)

# Subset the data for the two countries of interest
country1 <- w8 %>% filter(Country == "Greece") %>% select(B:F) %>% pull()
country2 <- w8 %>% filter(Country == "Bulgaria") %>% select(B:F) %>% pull()

# Perform the Wilcoxon rank sum test
wilcox.test(country1, country2, alternative = "two.sided")

library(rmarkdown)
render("Antibacterial Consumption.R", output_format = "word_document")

