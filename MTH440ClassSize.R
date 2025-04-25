library(readr); library(dplyr);library("xlsx"); library(tidyr)

Class24 = read_csv('ClassSizebyGenPopulation24.csv')
names(Class24) = Class24[1,]
Class24 = Class24[-1,]
Class24 = subset(Class24, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class24$Year = "2024"

Class23 = read_csv('ClassSizebyGenPopulation23.csv')
names(Class23) = Class23[1,]
Class23 = Class23[-1,]
Class23 = subset(Class23, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class23$Year = "2023"

Class22 = read_csv('ClassSizebyGenPopulation22.csv')
names(Class22) = Class22[1,]
Class22 = Class22[-1,]
Class22 = subset(Class22, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class22$Year = "2022"

Class21 = read_csv('ClassSizebyGenPopulation21.csv')
names(Class21) = Class21[1,]
Class21 = Class21[-1,]
Class21 = subset(Class21, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class21$Year = "2021"

Class20 = read_csv('ClassSizebyGenPopulation20.csv')
names(Class20) = Class20[1,]
Class20 = Class20[-1,]
Class20 = subset(Class20, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class20$Year = "2020"

Class19 = read_csv('ClassSizebyGenPopulation19.csv')
names(Class19) = Class19[1,]
Class19 = Class19[-1,]
Class19 = subset(Class19, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class19$Year = "2019"

Class18 = read_csv('ClassSizebyGenPopulation18.csv')
names(Class18) = Class18[1,]
Class18 = Class18[-1,]
Class18 = subset(Class18, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class18$Year = "2018"

Class17 = read_csv('ClassSizebyGenPopulation17.csv')
names(Class17) = Class17[1,]
Class17 = Class17[-1,]
Class17 = subset(Class17, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class17$Year = "2017"

Class16 = read_csv('ClassSizebyGenPopulation16.csv')
names(Class16) = Class16[1,]
Class16 = Class16[-1,]
Class16 = subset(Class16, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class16$Year = "2016"

Class15 = read_csv('ClassSizebyGenPopulation15.csv')
names(Class15) = Class15[1,]
Class15 = Class15[-1,]
Class15 = subset(Class15, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class15$Year = "2015"

Class14 = read_csv('ClassSizebyGenPopulation14.csv')
names(Class14) = Class14[1,]
Class14 = Class14[-1,]
Class14 = subset(Class14, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class14$Year = "2014"

Class13 = read_csv('ClassSizebyGenPopulation13.csv')
names(Class13) = Class13[1,]
Class13 = Class13[-1,]
Class13 = subset(Class13, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class13$Year = "2013"

Class12 = read_csv('ClassSizebyGenPopulation12.csv')
names(Class12) = Class12[1,]
Class12 = Class12[-1,]
Class12 = subset(Class12, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class12$Year = "2012"

Class11 = read_csv('ClassSizebyGenPopulation11.csv')
names(Class11) = Class11[1,]
Class11 = Class11[-1,]
Class11 = subset(Class11, select = c('District Name', 'District Code', 'Total # of Classes', 'Average Class Size', 'Number of Students'))
Class11$Year = "2011"

ClassTotal = rbind(Class11, Class12, Class13, Class14, Class15, Class16, Class17, Class18, Class19, Class20, Class21, Class22, Class23, Class24)
options(digits=14)

ClassTotal$`Total # of Classes` = as.numeric(gsub(",","",ClassTotal$`Total # of Classes`))
ClassTotal$`Number of Students` = as.numeric(gsub(",","",ClassTotal$`Number of Students`))
ClassTotal$`Average Class Size` = as.numeric(ClassTotal$`Average Class Size`)

ClassTotal = drop_na(ClassTotal)

b = nrow(ClassTotal)
for (x in 1:b) {
  a = as.numeric(ClassTotal[x,5])
  if (100 > a) {
    print(x)
  } else {
  }
}

ClassTotal = ClassTotal[-c(11,91,132,133,148,152,190,289,296,390,435,494,517,527,534,540,580,671,685,690,693,791,897,920,935,955,981,1087,1092,1095,1146,1194,1309,1325,1340,1387,1495,1500,1503,1601,1672,1715,1731,1746,1793,1839,1901,1908,2121,2137,2152,2199,2244,2306,2313,2401,2526,2542,2557,2603,2617,2621,2711,2718,2722,2806,2931,2947,2962,2996,3009,3118,3125,3213,3338,3354,3371,3417,3527,3534,3620,3741,3757,3774,3821,3931,3938,4024,4142,4158,4175,4217,4223,4333,4340,4403,4425,4559,4576,4624,4701,4734,4740,4817,4826,4942,4943,4958,4975,4980,5010,5022,5133,5139,5194,5203,5225,5341,5357,5374,5379,5380,5421,5531,5537,5582,5592,5597,5602,5625),]

write.csv(ClassTotal, "C:/Users/jbaia/OneDrive/Desktop/RProjects/ClassTotal.csv")











