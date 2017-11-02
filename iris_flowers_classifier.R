library('caret')

# load the CSV file from the local directory
dataset <- read.csv("iris.csv", header=FALSE)

# Set the colomn names in the dataset
colnames(dataset) <- c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width', 'Species')

# Create training and validation datasets
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
validation <- dataset[-validation_index,]
training <- dataset[validation_index,]

# Density plots for each attribute by class value
x <- training[,1:4]
y <- training[,5]
print('Ploting the training data set attributes')
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

# Run algorithms using 10-fold cross validation
control <- trainControl(method='cv', number = 10)
metric <- 'Accuracy'

# Build the 5 models

# a) Linear Algorithms
set.seed(7)
fit.lda <- train(Species~., data=training, method='lda', metric=metric, trControl=control)

# b) Non-Linear Algorithms
#CART
set.seed(7)
fit.cart <- train(Species~., data=training, method='rpart', metric=metric, trControl=control)
#kNN
set.seed(7)
fit.knn <- train(Species~., data=training, method='knn', metric=metric, trControl=control)

# c) Advanced Algorithms
# SVM
set.seed(7)
fit.svm <- train(Species~., data=training, method='svmRadial', metric=metric, trControl=control)
# Random Forest
set.seed(7)
fit.rf <- train(Species~., data=training, method='rf', metric=metric, trControl=control)

# Summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)

# summarize Best Model
print(fit.lda)

# Estimate the precision of LDA on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)