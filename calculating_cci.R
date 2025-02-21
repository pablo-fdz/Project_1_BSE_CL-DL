# install.packages("medicalrisk")
library(medicalrisk)  # Import library with functions for computing CCI

icu_data <- read.csv("preprocessed_datasets/01_merged_diagnoses_traintest.csv")

icu_data$ICD9_ordered_comorbidities_string <- as.character(icu_data$ICD9_ordered_comorbidities_string) # nolint: line_length_linter.

# Assuming your ICD-9 codes are in a column called 'all_dx' and your unique identifier is 'stay_id' # nolint: line_length_linter.
comorbidity_df <- generate_comorbidity_df(icu_data, 
                                          idvar = "icustay_id", 
                                          icd9var = "ICD9_ordered_comorbidities_string") # nolint: line_length_linter.

comorbidity_df  # Note that there are some Trues (which signals that a patient has a comorbidity)! # nolint: line_length_linter.

# Compute comorbidity score
charlson_df <- generate_charlson_index_df(comorbidity_df, 
                                          idvar = "icustay_id", 
                                          weights = medicalrisk::charlson_weights) # nolint: line_length_linter.

# Export the merged data frame to a CSV file.
write.csv(charlson_df, file = "preprocessed_datasets/02_icu_comorbidity_indexes.csv", row.names = FALSE) # nolint: line_length_linter.