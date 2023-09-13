# Comparative-Analysis
The antimicrobial-Consumption.R script analyses country-specific antimicrobial consumption data.
•	The script loads readxl and reads the "Annex_1_ESAC-Net_report_2020_downloadable_tables.xlsx" Excel file. The data is read from sheet 8, bypassing 3 header rows and specifying column types.
•	The Excel data frame columns are renamed.
•	It calculates the mean, standard deviation, and median for columns B-F and K-L and stores them in data_stats.
•	Finding the row with the greatest mean consumption from columns B-F determines the country with the highest antibacterial consumption.
•	Finding the row with the lowest mean sd from columns K-L yields the country with the lowest standard deviation (sd).
•	It displays the country with the highest consumption, its descriptive statistics (mean, standard deviation, and median), and the country with the lowest sd.
•	It compares Greece and Bulgaria's antibacterial consumption with a t-test. The hypotheses, test statistic, p-value, and 95% confidence interval are printed.
•	The p-value determines whether to reject the null hypothesis that the two countries' mean antimicrobial usage is not significantly different.
•	Finally, it compares Greece and Bulgaria's antimicrobial usage using the Wilcoxon rank sum test.
This report illuminates Greek and Bulgarian antimicrobial consumption. Greece had the highest mean consumption, indicating more antibacterial medicine use, however the test findings show no significant difference between the two countries. These findings suggest more research into antimicrobial usage and healthcare policies in both countries.
