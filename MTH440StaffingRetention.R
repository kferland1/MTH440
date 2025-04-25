library(readr); library(dplyr);library("xlsx")

Retention23 = read_csv('staffingretention2023.csv')
names(Retention23) = Retention23[1,]
Retention23 = Retention23[-1,]
Retention23$Year = "2023"

sum(Retention22[3,5])

Retention22 = read_csv('staffingretention2022.csv')
names(Retention22) = Retention22[1,]
Retention22 = Retention22[-1,]
Retention22$Year = "2022"

Retention21 = read_csv('staffingretention2021.csv')
names(Retention21) = Retention21[1,]
Retention21 = Retention21[-1,]
Retention21$Year = "2021"

Retention20 = read_csv('staffingretention2020.csv')
names(Retention20) = Retention20[1,]
Retention20 = Retention20[-1,]
Retention20$Year = "2020"

Retention19 = read_csv('staffingretention2019.csv')
names(Retention19) = Retention19[1,]
Retention19 = Retention19[-1,]
Retention19$Year = "2019"

Retention18 = read_csv('staffingretention2018.csv')
names(Retention18) = Retention18[1,]
Retention18 = Retention18[-1,]
Retention18$Year = "2018"

Retention17 = read_csv('staffingretention2017.csv')
names(Retention17) = Retention17[1,]
Retention17 = Retention17[-1,]
Retention17$Year = "2017"

Retention16 = read_csv('staffingretention2016.csv')
names(Retention16) = Retention16[1,]
Retention16 = Retention16[-1,]
Retention16$Year = "2016"

Retention15 = read_csv('staffingretention2015.csv')
names(Retention15) = Retention15[1,]
Retention15 = Retention15[-1,]
Retention15$Year = "2015"

Retention14 = read_csv('staffingretention2014.csv')
names(Retention14) = Retention14[1,]
Retention14 = Retention14[-1,]
Retention14$Year = "2014"

Retention13 = read_csv('staffingretention2013.csv')
names(Retention13) = Retention13[1,]
Retention13 = Retention13[-1,]
Retention13$Year = "2013"

Retention12 = read_csv('staffingretention2012.csv')
names(Retention12) = Retention12[1,]
Retention12 = Retention12[-1,]
Retention12$Year = "2012"

Retention11 = read_csv('staffingretention2011.csv')
names(Retention11) = Retention11[1,]
Retention11 = Retention11[-1,]
Retention11$Year = "2011"

Retention10 = read_csv('staffingretention2010.csv')
names(Retention10) = Retention10[1,]
Retention10 = Retention10[-1,]
Retention10$Year = "2010"

Retention09 = read_csv('staffingretention2009.csv')
names(Retention09) = Retention09[1,]
Retention09 = Retention09[-1,]
Retention09$Year = "2009"

RetentionTotal = rbind(Retention09, Retention10, Retention11, Retention12, Retention13, Retention14, Retention15, Retention16, Retention17, Retention18, Retention19, Retention20, Retention21, Retention22, Retention23)
RetentionTotal$`District Code`= as.character(RetentionTotal$`District Code`)
write.xlsx(RetentionTotal, "C:/Users/jbaia/OneDrive/Desktop/RProjects/RetentionTotal.xlsx")
