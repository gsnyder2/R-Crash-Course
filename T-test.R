#Import crabs data to conduct a two sample t-test - R_crab_data, header = yes
#Welch Two Sample t-test
crabs<- R_crab_data  
t.test(length~sex,data=crabs)
t.test(length~sex,data=crabs,var.equal=T)
  
#Make a graph to visually inspect the data set
boxplot(length~sex,data=crabs)

#Improve graph by adding labels and notches
boxplot(length~sex,data=crabs, notch=T, xlab="sex",ylab="merus length (mm)")
