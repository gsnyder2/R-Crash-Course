#R as a calculator
2+4
2*6
sqrt(16)
log(100)
exp(4)

#Assigning variables to numbers, functions, plots, etc. 
x<-6
x
2*x

y<-rep(2,4) #rep: "repeat", repeats a number or letter a given number of times
y
y/3

c(x,y,84) #c: "concatenate", links together a series of numbers or letters into one vector, can think of it as "combine"

rep('y', 12)
rep(y,12) #see the difference from the last line, how you call an assigned variable vs. the actual letter or word, really important for changing titles and labels on graphs

z<-c(2,4,7,8,9)
a<-c(rep(z,2),1000,2000)
a

#Creating small datasets
row1<-c(2,4,5,7) #recognize that I assigned "row1" as a series of numbers
row2<-c(12,23,34,23)
data<-rbind(row1,row2) #rbind will combine "row1" and "row2" as rows, because of the "r" before "bind"
data2<-cbind(row1,row2) #makes the same table but in 2 columns instead of 2 rows
data
data2

color<-c("orange","yellow","green","black") #we can use nonumerical data with ""; in this case we don't actually need the "", but it is really important to practice using "" for names and nonnumerical data, many functions and packages will not read that inforamtion if you don't incase with ""
freq<-c(34,54,6,17)
color
freq
data3<-rbind(color,freq) #we are pairing the colors with observation totals, paired in the ordere they appear (orange = 34)
data3

summary(color) #tells you what type of data you have
summary(freq) #when you get these values it means you have numerical data
color=as.factor(color)
summary(color) #so remember that color was a character-type of data? well the previous line changed it to factor-type, confirmed by this summary line
#factor and character data are both meant for nonnumerical data or numerical metadata like dates that are, well, factors, and not the data you want to analyze
#however, character data isn't always allowed for various tests, so sometimes it's useful to just change all of your metadata columns to factors instead of characters 


#create sequences
seq(4,9) #prints out the series between 4 and 9, automatically by whole integers
seq(6,42,2) #this prints out the range by integers of 2

#how to make a martix, very useful in various graphing packages
matrix(1:12,3,4) #A matrix has two dimensions. An array has 3 or more. Here we use values from 1 to 12 in whole integers, with 3 rows by 4 columns 
?matrix
matrix(1:12,3,4,byrow=T) #fill in matrix from left to right, top to bottom
matrix(1:12,3,4,byrow=F) #fill in matrix from top to bottom, then left to right
x=matrix(1:12,3,4,dimnames=list(c("A","B","C"),c("1","2","3","4"))) #dimnames is just the labels for the rows and columns 
x 
t(x) # To transpose a matrix

#dataframes, also useful in various graphing packages
newdata=data.frame(x=c(1,2,3,4),y=c(5,6,7,8))
newdata
newdata$x #this syntax is going to come up a lot, where you have the dataframe$variable and the $ separates the dataset from the specific vairable within the dataset

#Misc in small datasets
x=seq(20,100,20) #be careful about reassigning the same variables, you will rewrite previous assignments
a=c(1,4,5) #to spit out the 1st, 4th, and 5th number in a sequence
x[a] #use square brackets when selecting values relaying to a vector
x[x!=80]   #! means "not", so != is not equal, so we get every number in the series that isn't 80
x[x>=70]
x[x>30 & x<92]   
x[x<30 | x>92]   # | means "or" and this is the straight line, not I or L
x[!(x<30 | x>92)] #"not" and "or"


#Large datasets (NA's are allowed)
#Reading in data, either choose "Import Dataset" under "Environment" in top right panel, or use commands
getwd() #will print out the directory that you are in, default to whatever directory this RStudio project was setup in; you can use setwd() to set the working directory somewhere else from where the project is located
flamingo=read.csv("flamingo.csv") #make sure filename is spelled correctly in ""
#note that you can call the filename whatever you like, so we can even call it "playtime" if your code looked like: playtime=read.csv("flamingo.csv")
flamingo #to print the dataset

dim(flamingo) #print number of samples and categories (columns)
summary(flamingo) 
sapply(flamingo,mean) 
?sapply
table(flamingo$Body.temp)
tapply(flamingo$Leg.Length,flamingo$Body.temp,mean)
?tapply


sort(flamingo$Body.temp) #sorting
order(flamingo$Body.temp) #to sort one variable by the values of another use order()
flamingo=flamingo[order(flamingo$Body.temp),]
flamingo

#Basic statistics
sd(flamingo$Body.temp) #standard deviation of Body temperature in the flamingo dataset
var(flamingo$Body.temp) #variation of body temperatures, or you can square the standard deviation value
standard.error=function(x) sd(x)/sqrt(length(x)) #no built-in command for standard error, so we have to build that function/equation
standard.error(flamingo$Leg.Length-flamingo$Body.temp) #also, note that this function is now in our Environment (top right panel)
#so if you don't save your RStudio Project when you exit or you clear the Environment, you are going to lose that function and have to rerun it


#Misc
help(rep) #pulls up help page on "rep" command
?rep #does the same thing
help.search('two sample t tests') #searches for help pages on two sample t tests
ls() #to see what your designated variables, datasets, etc. that are currently loaded
rm(x)  # removes objecy "x" from the workspae
rm(list = ls())  # removes all objects from the list (because of the ls() portion)
head(flamingo) #head function gives you a peek at the dataset, which you'll have to reload if you ran that last function :) 
#one last note, you can run more than one line at a time, so if you deleted or failed to save the workspace when you closed R, you can select all the line ^ or desired portion and click on "Run" in the top of this panel (or Command + Shift in Macs, idk what it is for PC's but you can google it)
