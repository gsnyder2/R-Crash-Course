#R as a calculator
2+4
2*6

x<-6
x
2*x

#COMMANDS
#rep: "repeat", repeats a number or letter a given number of times
y<-rep(2,4)
y
y/3

#c: "concatenate", links together a series of numbers or letters into one vector
c(x,y,84)
rep('c', 12)
z<-c(2,4,7,8,9)
z
a<-c(rep(z,2),1000,2000)
a

#help: opens an information window regarding the use of a specific command
#help.search: searches for commands and information related to a given topic. Uses hyphens or quotes (' or ").
help(rep)
help.search('chi-square')

#DATA SETS
#You can type and save small data sets for quick analysis
row1<-c(2,4,5,7)
row2<-c(12,23,34,23)
data<-rbind(row1,row2)
data

col1<-c(2,4,5,7)
col2<-c(12,23,34,23)
data2<-cbind(col1,col2)
data2

color<-c("black","green","blue","red")
frequency<-c(34,54,6,6)
data3<-cbind(color,frequency)
transform(data3, frequency = as.numeric(frequency))

#to see what your designated variables, datasets, etc. that are currently loaded, 
ls()
