Coursera Project - Shiny Web Application 
========================================================
author: Komal Kukreja
date: August 23, 2015


Overview
========================================================

The application predicts the chances of survival of a passenger on the titanic ship.

It takes following details as input from user about the passenger.

- Gender
- Age
- Passenger Class

File source: Dataset "train.csv" for Titanic machine learning excercise from kaggle website.

Process
========================================================

- I created a model from training dataset using predictors age, gender, and class to get the outcome 'Survived'.

- Age has been categorized as adult (= or >18) and minor (<18 years).

- So this model has 12 combinations of age (adult or minor), gender (female or male), and class (class 1 or 2 or 3).

- The program looks up this model for the values provided by user and fetches the Survival chance and returns to the user.

- The output is the chances of survival for a passenger in terms of percentage.

Model for look-up table
========================================================

```r
fit1 <- aggregate(Survived ~ adult + Pclass + Sex, 
                  data=trainDataSet, 
                  FUN=function(x) {sum(x)/length(x)})
```


Links
========================================================

Application: https://komalkukreja.shinyapps.io/titanicprediction


Source Code:




