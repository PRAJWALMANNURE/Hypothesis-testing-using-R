#for reading the datasets from storage
library(readr)
#for choosing the required data set
cutlets_data <- read.csv(file.choose())
View(cutlets_data)

#Exploratory Data Analysis
#For checking the business moments(mean,median,mode etc)
summary(cutlets_data)
#Nomality test.
shapiro.test(cutlets_data$Unit.A)
shapiro.test(cutlets_data$Unit.B)

#for data visualization.
library(ggpubr)
ggdensity(cutlets_data$Unit.A)
ggdensity(cutlets_data$Unit.B)#For checking the shape of the data curve.
hist(cutlets_data$Unit.A)
hist(cutlets_data$Unit.B)
boxplot(cutlets_data$Unit.A,horizontal = T)
boxplot(cutlets_data$Unit.B,horizontal = T)

#Mannwhitneys-test.
wilcox.test(cutlets_data$Unit.A,cutlets_data$Unit.B)#for two Independent variables.

#RESULTS
#Shapiro-Wilk normality test
#data:  cutlets_data$Unit.A  W = 0.96495, p-value = 0.32

#Shapiro-Wilk normality test
#data:  cutlets_data$Unit.B  W = 0.97273, p-value = 0.5225


#Wilcoxon rank sum test
#data:  cutlets_data$Unit.A and cutlets_data$Unit.B W = 669, p-value = 0.513
#alternative hypothesis: true location shift is not equal to 0
#p-value is higher than significance value so we accept null hypothesis.

# H0:  diameter of cutlet of unit A = diameter of cutlet of unit B
# Ha:  diameter of cutlet of unit A is not = diameter of cutlet of unit B
