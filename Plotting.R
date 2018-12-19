#Base R graphing to start with, moving on to packages later
x = c(1, 2, 3, 4)
y = c(5, 6, 7, 8)
plot(x, y) 
plot(x, y,type="l") #explore ?plot for the various aesthetics you can add or change, like the type of scatter plot, try type = l,p,b,c,o,h,s,S,and n
?plot
#export the graph by choosing "Export" under the "Plots" tab in the bottom right panel

####basic plots####
flamingo<-read.csv("flamingo.csv")
hist(flamingo$Body.temp)
hist(flamingo$Leg.Length)
plot(flamingo$Body.temp,flamingo$Leg.Length)
plot(Leg.Length~Body.temp,data=flamingo) 
plot(flamingo$Body.temp,flamingo$Leg.Length) ##VERY IMPORTANT TO BE FAMILIAR WITH BOTH OF THESE SYNTAX METHODS FOR GRAPHING, they do the same thing, but the order is different because of the ~ vs. a comma, so be sure of what you want the x and y axis variables to be and adjust 
plot(flamingo$Body.temp,flamingo$Leg.Length, xlab = "Body temperature (C)",ylab = "Leg length (cm)",main = "Flamingo data") #add labels
plot(flamingo$Body.temp,flamingo$Leg.Length, xlab = "Body temperature (C)",ylab = "Leg length (cm)",main = "Flamingo data")
plot(flamingo$Body.temp,flamingo$Leg.Length, pch=18, xlab = "Body temperature (C)",ylab = "Leg length (cm)",main = "Flamingo data") #https://www.statmethods.net/advgraphs/parameters.html to see various point shape options (pch)
plot(flamingo$Body.temp,flamingo$Leg.Length, pch=18, col="red", xlab = "Body temperature (C)",ylab = "Leg length (cm)",main = "Flamingo data") #change colors

colors() #to see all the built-in color options
plot(flamingo$Body.temp,flamingo$Leg.Length, pch=18, col="red", xlab = "Body temperature (C)",
     ylab = "Leg length (cm)",main = "Flamingo data") #code too long? use the Tab to break it up into 2 lines; R knows that you haven't finished your code on the first line because of the unfinished ()
points(38.35,39.0, col="orange",pch=9) #adds a point(s) to the graph you last ran
points(flamingo$Body.temp,flamingo$Leg.Length,col="purple",pch=8) #you can do the same with a dataset; since this is the same dataset, it just covered the first points
abline(39,0,col="blue") #add a straight line with the standard x,y format
lines(flamingo$Body.temp,flamingo$Leg.Length,col="green",lty=8) #this lty will change the style of lines; looks crazy because R drew the lines in the order of the flamingo number

plot(flamingo$Body.temp,flamingo$Leg.Length, pch=18, col="red", xlab = "Body temperature (C)",
     ylab = "Leg length (cm)",main = "Flamingo data") #want to change the axis range? also note that if we run a new plot, we loose all those extra points and lines and such 
plot(flamingo$Body.temp,flamingo$Leg.Length, xlim=c(38,39.5), ylim=c(38,39.5), pch=18, col="red", xlab = "Body temperature (C)",
     ylab = "Leg length (cm)",main = "Flamingo data") #note the different ranges

plot(flamingo$Body.temp,flamingo$Leg.Length, bty="u",pch=18, col="red", xlab = "Body temperature (C)",
     ylab = "Leg length (cm)",main = "Flamingo data") #here we changed the plot frame style, default is o, other options are n,7,l, and c

axis(2,col="orchid") #now I'm just changing the actual x and y axis lines, here just the colors
axis(1,col="yellow")

plot(flamingo$Body.temp,flamingo$Leg.Length, pch=18, col="red", xlab = "Body temperature (C)",
     ylab = "Leg length (cm)",main = "Flamingo data")

text(38.5,39,"What's up",col = "blue") #add text at a certain spot in the graph, could be really useful in labeling groups in boxplots and barplots, etc
mtext("Howdy",side=4, line=0,col="orchid")
mtext(paste("Road",1:4),side=1:4,line=-1,font=33,col="green") #okay so here all we did was add text with a string of letters (road) with sequential numbers 1-4, but you can make it whatever you want (e.g. degrees, directions)

#in case you haven't noticed already, you do NOT need to have the special aestetics in any certain order (e.g. color, then title, or title, then color, doesn't matter), but you should describe the data you are applying it to first at least 
#see #https://www.statmethods.net/advgraphs/parameters.html for options on fonts, colots and sizes of margins, and other aestic options
#don't forget about ? for help pages that show options and colors() for available colors
#https://www.statmethods.net/advgraphs/axes.html

####histograms & barplotss####
hist(flamingo$Leg.Length) #pretty basic histogram, we created bins of the leg length and graphed the frequency for each bin
hist(flamingo$Leg.Length,col="lightblue",xlab="Leg length",main="") #same style as 
hist(flamingo$Leg.Length,col="lightblue",xlab="Leg length",main="",breaks=5) #breaks do NOT need to be same size everytime, look into using seq() to change this

palythoa=read.csv("palythoa.csv") #this dataset is showing whether the zoanthid palythoa grew (1) or not(0) if there were fireworms present (tank 1) or not (0)
head(palythoa) #take a sneakpeek with this head commmand
paly=table(palythoa$Tank,palythoa$Growth)
dimnames(paly)=list(c("Fireworms present", "Fireworms absent"),c("Palythoa no growth", "Palythoa  growth"))
paly #view this in table form, use dimnames to make sure we understand the numbers
barplot(paly,legend=TRUE) #say false or use default for none
barplot(paly,beside=TRUE, legend=TRUE,col=c("maroon", "blue"), main="Palythoa vs. Fireworms") 
barplot(paly,beside=FALSE, legend=TRUE,col=c("maroon", "blue")) #false means it will be stacked
mosaicplot(t(paly),col=c("maroon","green"),main="Palythoa vs. Fireworms", xlab = "Fireworm Infection") #these are shown as percentages, where the width of each column is based on the percentage in the total sample (lightly infected had more individuals in the sample than the other two)
#you should play with the gaps in this one, but you should be able to easily figure that out


####Using par to make multi-panel plots####
?par
par(mfcol=c(3,1),mar=c(4,4,2,1)) #mar is controlling the margin size, you can try running without it but won't look as nice as this
plot(flamingo$Leg.Length,flamingo$Body.temp)
hist(flamingo$Leg.Length)
hist(flamingo$Body.temp)

dev.off() #this line will turn off par or else everything from here on will make the panels

#So from here we are going to end with base R and move on to packages, and I'm primarily going to describe ggplot 


####Using ggplot####
install.packages("ggplot2")
library(ggplot2)
?ggplot # I highy recommend to find some good ggplot help pages online if you endeavor to use it
  #I also recommend against memorizing all of these codes and phrases that you can't look up later or use a template for

####point/scatter plots####
polyps <- read.csv("polyps.csv")

plot(polyps$Bundles.ofgametes.,polyps$Polypnumber)

#vs

ggplot(polyps, aes(x=Bundles.ofgametes., y=Polypnumber)) +
  geom_point() #the thing with ggplot is that you add the type of plot, most of the time, after you've described the aesthetics 

#Remember that R can't undestand charcters like spaces or () in names, so it changes those to "." by default
#Don't like that long "Bundles.ofgametes." name? shorten it!

names(polyps)[names(polyps) == 'Bundles.ofgametes.'] <- 'Bundles'

ggplot(polyps,aes(x=Bundles,y=Polypnumber, color=Tank))+
  geom_point()
ggplot(polyps,aes(x=Bundles,y=Polypnumber, color=Species))+
  geom_point()
ggplot(polyps,aes(x=Bundles,y=Polypnumber, color=Species))+
  geom_point()+
  facet_wrap(~Species)+ #splits up, there are a bunch of options for how to split and stack, either use the help function to find them or delete "wrap" and look through the options
  geom_smooth() #this is via modeling, NOT a standard error or deviation range, those would be straight lines

#adding lines

snails <-read.csv("snails.csv")
names(snails)[names(snails) == 'Responserate.s.'] <- 'Rate'

library(wesanderson) #personal favorite color palette, not necessary, but you'll need to change the entries in the scale_color_manual line

ggplot(data=snails, aes(x=Hours, y=Rate, group=Snail, color=Snail)) +
  geom_line() + #if you just want the points, delete this line
  geom_point()+ #if you do NOT want the points, delete this line
  xlab("Hours")+ ggtitle("Response rate of snails after stimulus")+ylab("Rate (seconds)")+
  #scale_y_continuous(labels = comma)+ #idk why this line isn't working, trying to remove the exponent formatting
  theme_grey()+ #remove this line if you want the stylistic ggplot, or you can delete the "_grey" and a box will pop up with the other options
  scale_color_manual(values=wes_palette(n=4, name="Darjeeling1"))


####histograms####
hist(polyps$Bundles,breaks=20)
ggplot(polyps, aes(Bundles)) + geom_histogram()
ggplot(polyps, aes(Bundles)) + geom_histogram(binwidth = 25) #don't worry about the warnings on the last one, but this is one of the ways you can fix it

ggplot(polyps, aes(Bundles, fill=Species)) +
  geom_histogram(binwidth = 25)  #adding an extra parameter with the fill

ggplot(polyps, aes(Bundles, fill=Species)) +
  geom_histogram(binwidth = 25)+  #adding an extra parameter with the fill
  facet_grid(Tank ~ .)
       
ggplot(polyps, aes(Bundles, fill=Species)) +
  geom_histogram(binwidth = 25)+ 
  facet_wrap(~Species, ncol = 1) #remember what I said earlier about there being many options to split             

#frequency plots

ggplot(polyps, aes(Bundles)) + geom_freqpoly()  

ggplot(polyps, aes(Bundles, color=Species)) +
  geom_freqpoly() +
  facet_wrap(~Species, ncol = 1)

ggplot(polyps, aes(Bundles, fill=Species)) + #since there isn't anything to fill in, it will remove the color and the legend, however, removng the whole "color=Species" will do the same thing
  geom_freqpoly() +
  facet_wrap(~Species, ncol = 1)


#http://r-statistics.co/ggplot2-Tutorial-With-R.html

  
#sciplot - great because its default error bars are standard error, unlike most other graphic packages, like base R and ggplot, whose default is the standard deviation
# I don't have a lot of experience in sciplot, but here's a basic barplot with standard error confidence shown
install.packages("sciplot")
library(sciplot)

bargraph.CI(polyps$Species,polyps$Polypnumber)
#There are many, many types of graphs in which you might need in the near future that are not described here, but hopefully from here you understand the principles
#you may see other graph types throughout the other tutorial scripts, so be sure to run those as well

