library(readr); library(dplyr);library("xlsx")

Salaries21 = read_csv('TeacherSalaries21.csv')
names(Salaries21) = Salaries21[1,]
Salaries21 = Salaries21[-1,]
Salaries21$Year = "2021"

Salaries20 = read_csv('TeacherSalaries20.csv')
names(Salaries20) = Salaries20[1,]
Salaries20 = Salaries20[-1,]
Salaries20$Year = "2020"

Salaries19 = read_csv('TeacherSalaries19.csv')
names(Salaries19) = Salaries19[1,]
Salaries19 = Salaries19[-1,]
Salaries19$Year = "2019"

Salaries18 = read_csv('TeacherSalaries18.csv')
names(Salaries18) = Salaries18[1,]
Salaries18 = Salaries18[-1,]
Salaries18$Year = "2018"

Salaries17 = read_csv('TeacherSalaries17.csv')
names(Salaries17) = Salaries17[1,]
Salaries17 = Salaries17[-1,]
Salaries17$Year = "2017"

Salaries16 = read_csv('TeacherSalaries16.csv')
names(Salaries16) = Salaries16[1,]
Salaries16 = Salaries16[-1,]
Salaries16$Year = "2016"

Salaries15 = read_csv('TeacherSalaries15.csv')
names(Salaries15) = Salaries15[1,]
Salaries15 = Salaries15[-1,]
Salaries15$Year = "2015"

Salaries14 = read_csv('TeacherSalaries14.csv')
names(Salaries14) = Salaries14[1,]
Salaries14 = Salaries14[-1,]
Salaries14$Year = "2014"

Salaries13 = read_csv('TeacherSalaries13.csv')
names(Salaries13) = Salaries13[1,]
Salaries13 = Salaries13[-1,]
Salaries13$Year = "2013"

Salaries12 = read_csv('TeacherSalaries12.csv')
names(Salaries12) = Salaries12[1,]
Salaries12 = Salaries12[-1,]
Salaries12$Year = "2012"

Salaries11 = read_csv('TeacherSalaries11.csv')
names(Salaries11) = Salaries11[1,]
Salaries11 = Salaries11[-1,]
Salaries11$Year = "2011"

Salaries10 = read_csv('TeacherSalaries10.csv')
names(Salaries10) = Salaries10[1,]
Salaries10 = Salaries10[-1,]
Salaries10$Year = "2010"

Salaries09 = read_csv('TeacherSalaries9.csv')
names(Salaries09) = Salaries09[1,]
Salaries09 = Salaries09[-1,]
Salaries09$Year = "2009"

Salaries08 = read_csv('TeacherSalaries8.csv')
names(Salaries08) = Salaries08[1,]
Salaries08 = Salaries08[-1,]
Salaries08$Year = "2008"

Totals = rbind(Salaries21, Salaries20, Salaries19, Salaries18, Salaries17, Salaries16, Salaries15, Salaries14, Salaries13, Salaries12, Salaries11, Salaries10, Salaries09, Salaries08)
Totals$`Salary Totals` = substring(Totals$`Salary Totals`, 2)
Totals$`Salary Totals` = as.numeric(gsub(",","",Totals$`Salary Totals`))
names(Totals)[3] = 'SalaryTotalsInDollars'
Totals$`Average Salary` = substring(Totals$`Average Salary`, 2)
Totals$`Average Salary` = as.numeric(gsub(",","",Totals$`Average Salary`))
names(Totals)[4] = 'AverageSalaryInDollars'
Totals$`District Code`= as.character(Totals$`District Code`)
SalariesTotal = Totals
write.xlsx(SalariesTotal, "C:/Users/jbaia/OneDrive/Desktop/RProjects/SalariesTotals.xlsx")

