# Estimating Doctoral Degree Holders Per State Using Ratio Estimators (2022 ACS Data)

## Description

This GitHub Repository contains all the files used to generate the paper *Estimating Doctoral Degree Holders Per State Using Ratio Estimators (2022 ACS Data)*.

The dataset from the 2022 ACS IPUMS data was analyzed to estimate the total number of respondents in each state based on the number of doctoral degree holders. Using California as a benchmark, the ratio estimators approach was applied to all other states to estimate total respondent numbers and compare them to the actual figures. Some of the R code used in this analysis was adapted from publicly available resources and tools from the R community.

## File Structure

The structure of this Repository is as follows:

- `data/raw_data` includes the raw IPUMS dataset used in the analysis.
- `data/analysis_data` includes the processed dataset used in the analysis after filtering and calculations.
- `llm` includes a `usage.txt` file providing information on language models used.
- `paper` includes the final paper (`paper.pdf`), the Quarto file (`paper.qmd`) used to create the PDF, and the references (`references.bib`).
- `scripts` contains R scripts for different stages of the analysis.

## LLM Usage Statement

This project utilized ChatGPT for assistance with code suggestions, explanations, and refining data visualizations. Comments detailing the specific instances where language models were used have been included directly in the relevant code scripts, and a complete overview of the LLM usage is provided in `usage.txt` located in `llm`.

This project was completed primarily using R for data analysis, processing, and visualization. All necessary scripts, data, and references are included in the Repository to ensure reproducibility.
