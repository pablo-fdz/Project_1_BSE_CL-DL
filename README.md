Author: Pablo Fernández.
Computational Learning and Deep Learning - BSE.

# Instructions on how to execute the pipeline

The machine learning pipeline is divided into 4 different, self-contained notebooks:
1. `1_2_taskdescr_featcreat_EDA_CLDL_P1` describes the task, creates (potentially) useful features and performs an EDA of the data.
2. `3_preprocessing_CLDL_P1` applies some preprocessing steps onto the data (only those that can be applied before cross-validation, to avoid data leakage).
3. `4_feature_selection_and_evaluation_CLDL_P1` performs hyperparameter tuning and tries to find the best performing model (in terms of the highest ROC-AUC).
4. `5_training_and_predicting__CLDL_P1` trains models with the optimal hyperparameters and predicts the probability of the outcome of the test data.

Additionally, `calculating_cci.R` computes the Charlson Comorbidity Index for each observation in the training and test datasets. Note that it is written in R, as the `medicalrisk` provides some out of the box functions that allow the computation of this mortality risk index.

On the other hand, the folders include the following files:
- `data`: the data that has been provided for the project (without modifications).
- `preprocessed_datasets`: modified datasets that have been created in steps 1 and 2 of the previous list.
- `hyperparameter_tuning`: pickled python files with the dictionaries of optimal hyperparameters and cross-validation scores for various models.
- `predictions`: predictions made in the Kaggle format, for different models.

Note that the `.csv` files are imported through relative paths in all of the notebooks. However, in notebooks 4 and 5, the pickled files are imported using the slash `/`. Therefore, if they are imported in Windows these should be modified for the code to run.