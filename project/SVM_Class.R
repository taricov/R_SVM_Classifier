
#Importing libraries:
library(e1071)

#Load the training data:
train <- read.table('F:\\Work\\MLprojects\\R\\SVM_Classification\\SVM_Training.csv', sep=',', header=T)

#Training the SVM model:
model <- svm(formula = Purchased ~ Income + Age, data=train, type='C-classification', kernel='linear')
  
#Loading the test data:
test <- read.table('F:\\Work\\MLprojects\\R\\SVM_Classification\\SVM_Test.csv', sep=',', header=T)

#Testing the model on the new data:
predictions <- predict(model, newdata= test[-4])

#Reporting the results:
conf.matrix <- table(test[,4], predictions)

#Relabeling cols and rows for readiness:
colnames(conf.matrix) <- c('model.wont_purchase', 'model.will_purchase')
rownames(conf.matrix) <- c('purchased', 'purchased')

#Previewing the result:
conf.matrix

#Activating the external server to work with R on Tableau:
library(Rserve)
Rserve::Rserve()
