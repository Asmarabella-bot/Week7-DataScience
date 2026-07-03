#Week8
#Load libraries
library(dplyr)
library(readxl)
#Upload Data
student_data <- read_excel("C:/Users/User/Downloads/student_data.xlsx")
View(student_data)

#FILTER
#student fail
Student_fail<- Student_fail<- student_data[student_data$final_exam_mark< 40,]
View(Student_fail)

#ARRANGE
#descending order
mydata1<- student_data %>% filter(final_exam_mark < 40) %>% arrange(desc(final_exam_mark))
View(mydata1)
#Ascending order
mydata2<- student_data %>% filter(final_exam_mark < 40) %>% arrange(final_exam_mark)
View(mydata2)

#SELECT function
mydata2<- student_data %>% select(student_id,coursework_mark,final_exam_mark)
View(mydata2)

#GLIMPSE
glimpse(student_data)

#MUTATE
mydata4 <- student_data%>% mutate(Total_Mark=(coursework_mark + final_exam_mark/200*100))
View(mydata4)

#DESCRIPTIVE STATISTICS
data(iris)
View(iris)
head(iris)
tail(iris)
str(iris)

min(iris$Sepal.Length)
max(iris$Sepal.Length)
range(iris$Sepal.Length)
sd(iris$Sepal.Length)
summary(iris)

#QUANTILE
A<-c(170.2, 181.5, 188.9, 163.9, 166.4, 163.7, 160.4, 175.8, 181.5)
quantile(A)

#COUNTING column and row
nrow(iris)
ncol(iris)
sum(is.na(iris$Sepal.Length))

hist(iris$Sepal.Length,
    main = "Histogram of Sepal Length",
    xlab = "Sepal Length (cm)",
    ylab = "Frequency",
    col = "lightblue",
    border = "black")

boxplot(Sepal.Length ~ Species,
    data = iris,
    main = "Sepal Length by Species",
    xlab = "Species",
    ylab = "Sepal Length (cm)",
    col = c("lightgreen", "lightpink", "lightyellow"))

data<-c(30,24,26,28,29,28,27,26,32,34,13,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)
boxplot(data, main = "Boxplot")

first_q<-quantile(data,0.25) #this is 26
third_q<-quantile(data,0.75) #this is 31.75
inter_q<-quantile(data,0.5)

#Quartile
iqr<-IQR(data)
#lower extreme
lower_extreme<-first_q - 1.5 * iqr 
#upper extreme
upper_extreme<-third_q + 1.5 * iqr


#How to deal with outlier
#remove the outlier
data_new<-data
data_new <- data_new[!data_new<lower_extreme]
data_new <- data_new[!data_new>upper_extreme]
data_new

#Replace the outlier with mean or average
data_new <- data
avg <- round(mean(data_new)) #for the purpose of example we round up value
data_new[data_new<lower_extreme] <- avg
data_new[data_new>upper_extreme] <- avg
data_new

#Replace with upper extreme and lower extreme value
data_new <- data
data_new[data_new<lower_extreme] <- lower_extreme
data_new[data_new>upper_extreme] <- upper_extreme
data_new
