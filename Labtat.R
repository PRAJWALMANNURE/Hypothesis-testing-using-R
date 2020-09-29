#LAB TAT reports assignment.
library(readr)
lab_tat <- read.csv(file.choose())
View(lab_tat)
#stacking the data for easier analysis
st_labtat <- stack(lab_tat)

#EDA
summary(lab_tat)
library(ggpubr)
#for checking the bell shape of the data
ggdensity(lab_tat$Laboratory.1)# follow bell shape
ggdensity(lab_tat$Laboratory.2)#does not follow perfect bell shape
ggdensity(lab_tat$Laboratory.3)#does not follow perfect bell shape
ggdensity(lab_tat$Laboratory.4)#follow bell shape

shapiro.test(lab_tat$Laboratory.1)#p-value is high, so data are normal
shapiro.test(lab_tat$Laboratory.2)#p-value is high, so data are normal
shapiro.test(lab_tat$Laboratory.3)#p-value is high, so data are normal
shapiro.test(lab_tat$Laboratory.4)#p-value is high, so data are normal

#bartlett test of variance test
bartlett.test(st_labtat$values,st_labtat$ind)#p-value is greater than 0.05

#Lavene test for variance
#install.packages(car)  
library(car)
leveneTest(st_labtat$values,st_labtat$ind)#for variance test p-value is 0.05161
 
#one way anova
#H0 : there is no difference in TAT of 4 laboratories.
#H1 : there is difference in TAT of 4 laboratories.
labtat_anova <- aov(st_labtat$values ~ st_labtat$ind, data = st_labtat)
summary(labtat_anova)


# RESULTS
#Shapiro-Wilk normality test
#data:  lab_tat$Laboratory.1 W = 0.99018, p-value = 0.5508

#Shapiro-Wilk normality test
#data:  lab_tat$Laboratory.2 W = 0.99363, p-value = 0.8637

#Shapiro-Wilk normality test
#data:  lab_tat$Laboratory.3 W = 0.98863, p-value = 0.4205

#Shapiro-Wilk normality test
#data:  lab_tat$Laboratory.4 W = 0.99138, p-value = 0.6619

#Bartlett test of homogeneity of variances
#data:  st_labtat$values and st_labtat$ind Bartlett's K-squared = 6.0995, df = 3, p-value = 0.1069

#leveneTest(st_labtat$values,st_labtat$ind)#for variance test p-value is 0.05161

#ANOVA RESULT
# Df Sum Sq Mean Sq F value Pr(>F)    
#st_labtat$ind   3  79979   26660   118.7 <2e-16 ***
 # Residuals     476 106905     225                   
#Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#hence we can conclude that there is a significant differences in TAT between the 4 laboratories
