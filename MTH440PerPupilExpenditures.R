library(readr); library(dplyr);library("xlsx")

Expenditures23 = read_csv('PerPupilExpenditures2023.csv')
names(Expenditures23) = Expenditures23[1,]
Expenditures23 = Expenditures23[-1,]
Expenditures23$Year = "2023"

Expenditures22 = read_csv('PerPupilExpenditures2022.csv')
names(Expenditures22) = Expenditures22[1,]
Expenditures22 = Expenditures22[-1,]
Expenditures22$Year = "2022"

Expenditures21 = read_csv('PerPupilExpenditures2021.csv')
names(Expenditures21) = Expenditures21[1,]
Expenditures21 = Expenditures21[-1,]
Expenditures21$Year = "2021"

Expenditures20 = read_csv('PerPupilExpenditures2020.csv')
names(Expenditures20) = Expenditures20[1,]
Expenditures20 = Expenditures20[-1,]
Expenditures20$Year = "2020"

Expenditures19 = read_csv('PerPupilExpenditures2019.csv')
names(Expenditures19) = Expenditures19[1,]
Expenditures19 = Expenditures19[-1,]
Expenditures19$Year = "2019"

Expenditures18 = read_csv('PerPupilExpenditures2018.csv')
names(Expenditures18) = Expenditures18[1,]
Expenditures18 = Expenditures18[-1,]
Expenditures18$Year = "2018"

Expenditures17 = read_csv('PerPupilExpenditures2017.csv')
names(Expenditures17) = Expenditures17[1,]
Expenditures17 = Expenditures17[-1,]
Expenditures17$Year = "2017"

Expenditures16 = read_csv('PerPupilExpenditures2016.csv')
names(Expenditures16) = Expenditures16[1,]
Expenditures16 = Expenditures16[-1,]
Expenditures16$Year = "2016"

Expenditures15 = read_csv('PerPupilExpenditures2015.csv')
names(Expenditures15) = Expenditures15[1,]
Expenditures15 = Expenditures15[-1,]
Expenditures15$Year = "2015"

Expenditures14 = read_csv('PerPupilExpenditures2014.csv')
names(Expenditures14) = Expenditures14[1,]
Expenditures14 = Expenditures14[-1,]
Expenditures14$Year = "2014"

Expenditures13 = read_csv('PerPupilExpenditures2013.csv')
names(Expenditures13) = Expenditures13[1,]
Expenditures13 = Expenditures13[-1,]
Expenditures13$Year = "2013"

Expenditures12 = read_csv('PerPupilExpenditures2012.csv')
names(Expenditures12) = Expenditures12[1,]
Expenditures12 = Expenditures12[-1,]
Expenditures12$Year = "2012"

Expenditures11 = read_csv('PerPupilExpenditures2011.csv')
names(Expenditures11) = Expenditures11[1,]
Expenditures11 = Expenditures11[-1,]
Expenditures11$Year = "2011"

Expenditures10 = read_csv('PerPupilExpenditures2010.csv')
names(Expenditures10) = Expenditures10[1,]
Expenditures10 = Expenditures10[-1,]
Expenditures10$Year = "2010"

Expenditures09 = read_csv('PerPupilExpenditures2009.csv')
names(Expenditures09) = Expenditures09[1,]
Expenditures09 = Expenditures09[-1,]
Expenditures09$Year = "2009"

Expenditures08 = read_csv('PerPupilExpenditures2008.csv')
names(Expenditures08) = Expenditures08[1,]
Expenditures08 = Expenditures08[-1,]
Expenditures08$Year = "2008"

ExpendituresTotals = rbind(Expenditures08,Expenditures09,Expenditures10,Expenditures11,Expenditures12,Expenditures13,Expenditures14,Expenditures15,Expenditures16,Expenditures17,Expenditures18,Expenditures19,Expenditures20,Expenditures21,Expenditures22,Expenditures23)
options(digits=14) #Allows for as numeric to include cents while accounting for digits of state totals

ExpendituresTotals = ExpendituresTotals[-c(5082, 5480),]

ExpendituresTotals$`In-District Expenditures` = substring(ExpendituresTotals$`In-District Expenditures`, 2)
ExpendituresTotals$`In-District Expenditures` = as.numeric(gsub(",","",ExpendituresTotals$`In-District Expenditures`))
names(ExpendituresTotals)[3] = 'In-Distict Expenditures In Dollars'

ExpendituresTotals$`In-District Expenditures per Pupil` = substring(ExpendituresTotals$`In-District Expenditures per Pupil`, 2)
ExpendituresTotals$`In-District Expenditures per Pupil` = as.numeric(gsub(",","",ExpendituresTotals$`In-District Expenditures per Pupil`))
names(ExpendituresTotals)[5] = 'In-District Expenditures per Pupil In Dollars'

ExpendituresTotals$`Total Expenditures` = substring(ExpendituresTotals$`Total Expenditures`, 2)
ExpendituresTotals$`Total Expenditures` = as.numeric(gsub(",","",ExpendituresTotals$`Total Expenditures`))
names(ExpendituresTotals)[6] = 'Total Expenditures In Dollars'

ExpendituresTotals$`Total Expenditures per Pupil` = substring(ExpendituresTotals$`Total Expenditures per Pupil`, 2)
ExpendituresTotals$`Total Expenditures per Pupil` = as.numeric(gsub(",","",ExpendituresTotals$`Total Expenditures per Pupil`))
names(ExpendituresTotals)[8] = 'Total Expenditures per Pupil In Dollars'

ExpendituresTotals$`Total In-district FTEs` = as.numeric(gsub(",","",ExpendituresTotals$`Total In-district FTEs`))
ExpendituresTotals$`Total Pupil FTEs` = as.numeric(gsub(",","",ExpendituresTotals$`Total Pupil FTEs`))

ExpendituresTotals$`District Code` = as.character(ExpendituresTotals$`District Code`)
#write.xlsx(ExpendituresTotals, "C:/Users/jbaia/OneDrive/Desktop/RProjects/ExpendituresTotals.xlsx")


