# Real Estate Price Prediction Reproduction:

## Overview:
This task contains a data file named `dataset_bds_chuan_hoa tong.csv`, a Jupyter Notebook that performs data cleaning, basic modeling, and advanced hyperparameter tuning for real estate prices.

## How to Reproduce:
1. Ensure `dataset_bds_chuan_hoa tong.csv` is in the folder.
2. Open `Reproduction_Code.ipynb` in Jupyter Notebook.
3. Click **Cell -> Run All**.
4. The notebook will automatically:
   - Install required libraries.
   - Clean the data.
   - Train the models.
   - Display the results and graphs.

## File Description:
- `Reproduction_Code.ipynb`:        The complete code for the project.
- `dataset_bds_chuan_hoa tong.csv`: The raw input data.
- `dataset_bds_final.xlsx`:         (Generated automatically) The cleaned data.
- `2b_price_distribution.png`:      (Generated automatically) Distribution of the target variable (Price).
- `2b_price_by_district.png`:       (Generated automatically) Fairness proxy visualization showing Price by District.
- `2c_Actual_vs_Predicted.png`:     (Generated automatically) Scatter plot comparing actual vs predicted values.
- `2c_Feature_Importance.png`:      (Generated automatically) Model feature importance visualization.
- `2c_residuals_hist.png`:          (Generated automatically) Histogram of residuals for error analysis.
- `2c_perm_importance.png`:         (Generated automatically) Permutation feature importance results.
- `2c_test_results_sample.csv`:     (Generated automatically) Sample of test set predictions and actual values.