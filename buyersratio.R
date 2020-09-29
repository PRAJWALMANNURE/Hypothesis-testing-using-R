#buyers ratio assignment
library(readr)
buyers <- read.csv(file.choose())
View(buyers)
summary(buyers)
mat_buyers<- as.matrix(buyers)#for converting data into matrix form
final_buyers <- as.data.frame(t(mat_buyers))#for converting rows into columns
View(final_buyers)
#chi-square test
chisq.test(final_buyers$V1,final_buyers$V2)

#RESULTS
#H0: all proportions are equal
#H1; all proportons are not equal


#Pearson's Chi-squared test data:
#final_buyers$V1 and final_buyers$V2 X-squared = 20,
#df = 16, p-value = 0.2202 
#Warning message: In chisq.test(final_buyers$V1, final_buyers$V2) : Chi-squared approximation may be incorrect

#As p- value is higher than alpha value we accept null hypothesis
