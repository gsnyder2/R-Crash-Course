#Example of uploading and using ggplot
install.packages("ggplot2")
library(ggplot2)

#let's use the opossum data! reload it if it is not already in your environment
opos<-R_opossum_length_data

#make a histogram of the total length
hist(opos$total_l,breaks=20)
#vs ggplot right off the bat, pretty basic styling...
ggplot(opos, aes(total_l)) + geom_histogram()

ggplot(opos, aes(total_l)) + geom_freqpoly()

#better binning, play with it

ggplot(opos, aes(total_l)) +
  geom_histogram(binwidth = 2)

#add an additional variable
ggplot(opos, aes(total_l, fill=sex)) +
  geom_histogram(binwidth = 2) 

#separate the new variable into separate histograms
ggplot(opos, aes(total_l, fill=sex)) +
  geom_histogram(binwidth = 2) +
  facet_wrap(~sex, ncol = 1)

#frequency plot
ggplot(opos, aes(total_l, color=sex)) +
  geom_freqpoly(binwidth = 2) 

ggplot(opos, aes(total_l, color=sex)) +
  geom_freqpoly(binwidth = 2) +
  facet_wrap(~sex, ncol = 1)

#remove color and key
ggplot(opos, aes(total_l, fill=sex)) +
  geom_freqpoly(binwidth = 2) +
  facet_wrap(~sex, ncol = 1)


##let's move onto correlation plots
plot(opos$total_l,opos$tail_l)

#vs

ggplot(opos, aes(x=total_l, y=tail_l)) +
  geom_point()

#change color
ggplot(opos, aes(total_l, tail_l)) +
  geom_point(color="blue")

#add additional variable
ggplot(opos, aes(total_l, tail_l, color=sex)) +
  geom_point()

#separate plots based on additional variable
ggplot(opos, aes(total_l, tail_l)) +
  geom_point() +
  facet_wrap(~sex)

#let's add a smoother line
ggplot(opos, aes(total_l, tail_l)) +
  geom_point() +
  geom_smooth()

#Conclusion of ggplot: syntax is different for every package, and you will need to read up on help and manual pages online to find what you need
#example, ggplot example help page: http://ggplot2.tidyverse.org/index.html