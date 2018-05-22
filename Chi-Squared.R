#CHI-SQUARE TEST: GOODNESS OF FIT.
  
colors<-c(34,54,6,6)
colors

#Chi-squared test for given probabilities
chisq.test(colors)

chisq.test(colors,p=rep(0.25,4))
  
 
length(colors)


chisq.test(colors,p=rep(1/length(colors), length(colors)))
  
qchisq(0.95,3)

qchisq(0.99,3)

chisq.test(colors,p=c(0.35,0.55,0.05,0.05))
  
  
chisq.test(colors,p=c(0.30,0.50,0.10,0.10))
  
 
#CHI-SQUARE TEST: INDEPENDENCE TEST
    
row1<-c(10,30)
row2<-c(40,20)
lizards<-rbind(row1,row2)
lizards
 
#Pearson's Chi-squared test with Yates' continuity correction
chisq.test(lizards)
  
chisq.test(lizards,correct=F)
  

#Import Dataset from top right window, and import R_lizards_data.txt, header = Yes, row names = first column
LIZARDS <- R_lizards_data
chisq.test(LIZARDS)
  
  
  