#faltoons assignment
library(readr)
fantaloons <- read.csv(file.choose())
View(fantaloons)
f1 <- data.frame(fantaloons)
View(f1)
Weekdays <- as.integer(f1$Weekdays=='Male')
Weekend <- as.integer(f1$Weekend=='Male')#converting txt to 0's & 1's
finalf1 <- cbind.data.frame(Weekdays,Weekend)#column binding with data framing is done
stacke_finalf1 <- stack(finalf1)#stacking the data for easier analysis
View(stacke_finalf1)
#chi-square test
chisq.test(stacke_finalf1$values,stacke_finalf1$ind)

#RESULTS
#Pearson's Chi-squared test with Yates' continuity correction

#data: stacke_finalf1$values and stacke_finalf1$ind X-squared = 15.434, df = 1, p-value = 8.543e-05

#as the p-value is less than significance value we accept alternate hypothesis
#i.e % of males versus females walking in to the store differ based on day of the week