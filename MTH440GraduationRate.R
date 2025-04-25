library(readr); library(dplyr);library("xlsx")

Graduation23 = read_csv('gradrates2023.csv')
names(Graduation23) = Graduation23[1,]
Graduation23 = Graduation23[-1,]
Graduation23$Year = "2023"

Graduation22 = read_csv('gradrates2022.csv')
names(Graduation22) = Graduation22[1,]
Graduation22 = Graduation22[-1,]
Graduation22$Year = "2022"

Graduation21 = read_csv('gradrates2021.csv')
names(Graduation21) = Graduation21[1,]
Graduation21 = Graduation21[-1,]
Graduation21$Year = "2021"

Graduation20 = read_csv('gradrates2020.csv')
names(Graduation20) = Graduation20[1,]
Graduation20 = Graduation20[-1,]
Graduation20$Year = "2020"

Graduation19 = read_csv('gradrates2019.csv')
names(Graduation19) = Graduation19[1,]
Graduation19 = Graduation19[-1,]
Graduation19$Year = "2019"

Graduation18 = read_csv('gradrates2018.csv')
names(Graduation18) = Graduation18[1,]
Graduation18 = Graduation18[-1,]
Graduation18$Year = "2018"

Graduation17 = read_csv('gradrates2017.csv')
names(Graduation17) = Graduation17[1,]
Graduation17 = Graduation17[-1,]
Graduation17$Year = "2017"

Graduation16 = read_csv('gradrates2016.csv')
names(Graduation16) = Graduation16[1,]
Graduation16= Graduation16[-1,]
Graduation16$Year = "2016"

Graduation15 = read_csv('gradrates2015.csv')
names(Graduation15) = Graduation15[1,]
Graduation15 = Graduation15[-1,]
Graduation15$Year = "2015"

Graduation14 = read_csv('gradrates2014.csv')
names(Graduation14) = Graduation14[1,]
Graduation14 = Graduation14[-1,]
Graduation14$Year = "2014"

Graduation13 = read_csv('gradrates2013.csv')
names(Graduation13) = Graduation13[1,]
Graduation13 = Graduation13[-1,]
Graduation13$Year = "2013"

Graduation12 = read_csv('gradrates2012.csv')
names(Graduation12) = Graduation12[1,]
Graduation12 = Graduation12[-1,]
Graduation12$Year = "2012"

Graduation11 = read_csv('gradrates2011.csv')
names(Graduation11) = Graduation11[1,]
Graduation11 = Graduation11[-1,]
Graduation11$Year = "2011"

Graduation10 = read_csv('gradrates2010.csv')
names(Graduation10) = Graduation10[1,]
Graduation10 = Graduation10[-1,]
Graduation10$Year = "2010"

Graduation09 = read_csv('gradrates2009.csv')
names(Graduation09) = Graduation09[1,]
Graduation09 = Graduation09[-1,]
Graduation09$Year = "2009"

Graduation08 = read_csv('gradrates2008.csv')
names(Graduation08) = Graduation08[1,]
Graduation08 = Graduation08[-1,]
Graduation08$Year = "2008"

GraduationTotal = rbind(Graduation08, Graduation09, Graduation10, Graduation11, Graduation12, Graduation13, Graduation14, Graduation15, Graduation16, Graduation17, Graduation18, Graduation19, Graduation20, Graduation21, Graduation22, Graduation23)
GraduationTotal$`District Code` = as.character(GraduationTotal$`District Code`)

GraduationTotal = GraduationTotal %>%
  rename(
    Number_In_Cohort = '# in Cohort',
    Percent_Graduated = '% Graduated',
    Percent_Still_In_school = '% Still in School'
  )
GraduationTotal = GraduationTotal %>%
  rename(
    Percent_Non_Grad_Completers = '% Non-Grad Completers',
    Percent_HS_Equiv = '% H.S. Equiv.',
    Percent_Dropped_Out = '% Dropped Out',
    Percent_Permanently_Excluded = '% Permanently Excluded'
  )

#write.xlsx(GraduationTotal, "C:/Users/jbaia/OneDrive/Desktop/RProjects/GraduationTotal.xlsx")
