#First import the opossum data. Go to top right window, Import Dataset, txt, heading = yes 
#View distribution of the data
opos <- R_opossum_length_data
hist(opos$total_l,breaks=20)
#Save figure if desired by choosing export in bottom right window


#Test if both variables have a normal distribution
#The null hypothesis of the Shapiro-Wilk Normality test is that the variable is normally distributed.
shapiro.test(opos$total_l)

#Total length seems fine and has a normal distribution, let's look at the other measurment           
hist(opos$tail_l,breaks=20)
shapiro.test(opos$tail_l)

#Tail length also seems fine, both are normall distributed! 

#Let's look at the correlation between tail and total length
plot(opos$total_l,opos$tail_l)

#And now let's see if there's a signifcant correlation with Pearson's correlation
cor.test(opos$total_l,opos$tail_l)

           
#Now let's try a Spearman's correlation test based on ranks
#Spearman's is used when one variables is not normal
           
hist(opos$age,breaks=20)
shapiro.test(opos$age)

#The variable "age" is not normally distributed
  
cor.test(opos$age,opos$total_l,method="spearman")

#when normality assumptions are met, the Spearman's rho is more conservative
#take a look at the difference in the p-values
  
cor.test(opos$total_l,opos$tail_l)
cor.test(opos$total_l,opos$tail_l,method="s")
