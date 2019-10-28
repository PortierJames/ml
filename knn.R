install.packages("gmodels")
library(gmodels)
install.packages("class")
library(class)

setwd('Documents/program')
cc <- read.csv(‘cc.csv’)

ccmod <- cc[-1]
ccmod$default.payment <- factor(ccmod$default.payment, levels = c(1, 0), labels = c(“Default”, “No Default”)

normalize <- function(x) { return ((x – min(x)) / (max(x) – min(x))) }
cc_n <- as.data.frame(lapply(ccmod[1:23], normalize))
summary(cc_n)

cc_train <- cc_n[1:28000,]
cc_test <- cc_n[28001:30000,]
cc_test_labels <- ccmod[1:28000,24]
cc_train_labels <- ccmod[28001:30000,24]

cc_test_pred <- knn(train = cc_train, test = cc_test, cl = cc_train_labels, k = 11)
CrossTable(x = cc_test_labels, y = cc_test_pred, prop.chisq=FALSE)
