library(readr)
ab <- read.csv(file.choose())
View(ab)
#converting data into 0's & 1's
Phillippines <- as.integer(ab$Phillippines=='Error Free')
Indonesia <- as.integer(ab$Indonesia=='Error Free')
Malta <- as.integer(ab$Malta=='Error Free')
India <- as.integer(ab$India=='Error Free')
final_ab <- cbind(Phillippines,Indonesia,Malta,India)
View(final_ab)
#storing the data in table forms.
abb <-data.frame(final_ab)
#Making the data in two columns for easier calculation
stack_ab <- stack(abb)
View(stack_ab)
#chi-square test.
chisq.test(stack_ab$values,stack_ab$ind)

#RESULTS
#Pearson's Chi-squared test
#data:  stack_ab$values and stack_ab$ind X-squared = 3.859, df = 3, p-value = 0.2771

#H0;defective % does not varies by center
#H1;defective % varies by center

#p-value is higher than 0.05 so we accept null hypothesis


