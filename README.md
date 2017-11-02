# Iris Flowers Classifier
Building an iris flowers classifier using R by comparing several machine learning models ( LDA, CART, kNN, SVM, RF) 

# Models Used
1. `Linear Discriminant Analysis`
2. `Classification and Regression Trees`
3. `k-Nearest Neighbors`
4. `Support Vector Machines with a linear kernel`
5. `Random Forest`


# Contents
This repository contains the following files :

1. `iris_flowers_classifier.R` - R Script for training and testing the classifiers
2. `iris.csv` - Dataset file containing features and labels from 150 observations of iris flowers
3. `iris_flowers_classifier.html` - R Markdown file

# Usage
* Clone the repository :
```bash
git clone https://github.com/Hamza-El-Achouri/iris_flowers_classifier.git
cd iris_flowers_classifier
```

* Then test the R script using the command :
```bash
Rscript iris_flowers_classifier.R
```

# Results
The script uses the iris flowers dataset, which contains 150 observations of iris flowers. There are four columns of measurements of the flowers in centimeters. The fifth column is the species of the flower observed. All observed flowers belong to one of three species.

Running the script will generate a (.pdf) file containing density plots for each attribute of the iris flowers by class value.
### Density plots for each attribute of the iris flowers by class value
![Density plots](https://i.imgur.com/5ztY2RA.png)

Then the 5 models are trained using an 80% portion of the dataset and then tested on the validation dataset. Results shows that the LDA model makes the most accurate predictions.
### Comparaison Result
![Comparaison Result](https://i.imgur.com/m2jxUS4.png)
