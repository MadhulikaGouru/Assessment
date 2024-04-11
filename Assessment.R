#Q1
#Creating a data frame and showing the structure of it. Also importing library functions.
install.packages("swirl")
install.packages("data.table")
install.packages("mice")
install.packages("VIM")

library("swirl")
library("data.table")
library("VIM")
library("mice")

#Reading the dataframe and viewing it.
london_crime<-read.csv("london-crime-data.csv")
View(london_crime)
str(london_crime)

#Creating a new Date colm, by adding other columns.
Date<-london_crime$day+london_crime$month+london_crime$year
london_crime$Date<-Date


#Q2
#Renaming  the variable names with new variable names.
london_crime<-setnames(london_crime, old="borough", new="Borough")
london_crime<-setnames(london_crime, old="major_category", new="MajorCategory")
london_crime<-setnames(london_crime, old="minor_category", new="SubCategory")
london_crime<-setnames(london_crime, old="value", new="Value")
london_crime<-setnames(london_crime, old="Date", new="CrimeDate")

#Q3
#converting the 'crimeDate' column to date datatype col.
converted_date<-as.Date(london_crime$CrimeDate,format = c("%Y-%d-%m", "%m/%d/%Y", "%Y-%d-%m"))
converted_date

#showing the structure of dataframe.
london_crime$CrimeDate <- converted_date
london_crime$CrimeDate
str(london_crime)

#Q4
#plotting the chart to show the summary of the borough.
london_crime$Borough <- as.factor(london_crime$Borough)
class(london_crime$Borough)


windows(16,10)
table(plot(london_crime$Borough, las = 2))
plot(table(london_crime$Borough))

title(xlab = "Borough", col.lab = rgb(0, 0.5, 0))
title(ylab = "Count", col.lab = rgb(0, 0.5, 0))


#Q5
#Displaying the pie chart for majorcategory variable.
windows(16,10)
par(mfrow = c(2, 2))
slices <- c(10, 12, 4, 16, 8)
lbls <- c("Burglary","Violence Against the Person","Theft and Handling","Criminal Damage","Drugs","Robbery","Sexual Offences","Other Notifiable Offences","Fraud or Forgery")
pie(slices, labels = lbls,
    main = "Simple Pie Chart")


#Q6
#Creating a new column region and comparing the variables.
london_crime$Region[london_crime$Borough =="Barking and Dagenham" ]<-"East"
london_crime$Region[london_crime$Borough=="Bexley"& "Greenwich"]<-"East"
london_crime$Region[london_crime$Borough=="Havering" & "Kingston upon Thames"]<-"East"
london_crime$Region[london_crime$Borough=="Newham" & "Redbridge" & "Wandsworth"] <- "East"

View(london_crime)


#Q7

Region
mytable <- table(Region)
mytable
# Use table headers for chart labels
lbls3 <- paste(names(Region), "\n", Region, sep = "")
lbls3
# Create the 3D pie chart
windows(16,10)
pie(mytable, labels = lbls3,
    main = "Pie Chart from a Table\n (with sample sizes)")


#Q10
write.csv(london_crime, file = "london_crime_modified.csv")

