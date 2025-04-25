library(readr); library(dplyr);library(ggplot2)
xs = read.csv("SalariesTotals.csv")
xg = read.csv('GraduationTotal.csv')
xc = read.csv('ClassTotal.csv')

xcselect = subset(xc, select = c('District.Code', 'Average.Class.Size','Year'))
xgselect = subset(xg, select = c('District.Code', 'Percent_Graduated', 'Year'))
xsselect = subset(xs, select = c('District.Code', 'AverageSalaryInDollars', 'Year'))


cgmerge = merge(xcselect, xgselect)
sgmerge = merge(xsselect, xgselect)


xCMergeAvg = cgmerge %>% group_by(District.Code) %>%
  summarise(mean_class_size = mean(Average.Class.Size)) #Class Size Averaging by year, grouped by district
xCGMergeAvg = cgmerge %>% group_by(District.Code) %>%
  summarise(mean_grad = mean(Percent_Graduated))
CLASSGRADAVG = merge(xCMergeAvg, xCGMergeAvg)


xSMergeAvg = sgmerge %>% group_by(District.Code) %>%
  summarise(mean_salary = mean(AverageSalaryInDollars)) #Salary Averaging by year, grouped by district
xSGMergeAvg = sgmerge %>% group_by(District.Code) %>%
  summarise(mean_grad = mean(Percent_Graduated))
SALARYGRADAVG = merge(xSMergeAvg, xSGMergeAvg)


ggplot(CLASSGRADAVG, aes(x=mean_class_size,y=mean_grad)) + #Graph of Averaged Class Size
  geom_point() +
  annotate("text", x=30, y=2,
           label = "min of 100 students",
           col = "blue",
           size = 5) +
  geom_smooth(method="lm", se=FALSE)


CLASSGRADAVGFILTER = filter(CLASSGRADAVG, mean_grad > 50)

ggplot(CLASSGRADAVGFILTER, aes(x=mean_class_size,y=mean_grad)) + #Graph of Averaged Class Size filtered for 50% graduation minimum
  geom_point() +
  annotate("text", x=25, y=52,
           label = "min of 100 students",
           col = "blue",
           size = 5) +
  geom_smooth(method="lm", se=FALSE)


ggplot(SALARYGRADAVG, aes(x=mean_salary,y=mean_grad)) + #Graph of Averaged Salary
  geom_point() +
  geom_smooth(method="lm", se=FALSE)

ggplot(SALARYGRADAVG, aes(x=mean_salary,y=mean_grad)) + #Graph of Averaged Salary
  geom_point() +
  geom_smooth(method="lm", se=FALSE)

SALARYGRADAVGFILTER = filter(SALARYGRADAVG, mean_grad > 50)

ggplot(SALARYGRADAVGFILTER, aes(x=mean_salary,y=mean_grad)) + #Graph of Averaged Salary filtered for 50% graduation minimum
  geom_point() +
  geom_smooth(method="lm", se=FALSE) +
  coord_cartesian(xlim = c(30000, 110000)) + 
  annotate("text", x = 100000, y = 60,
           label = "min of 50% graduation rate",
           col = "blue",
           size = 5)

ggplot(SALARYGRADAVGFILTER, aes(x=mean_salary,y=mean_grad)) + #Graph of Averaged Salary filtered for 50% graduation minimum
  geom_point() +
  geom_smooth(method="lm", se=FALSE) +
  coord_cartesian(xlim = c(30000, 110000)) + 
  annotate("text", x = 100000, y = 60,
           label = "min of 50% graduation rate",
           col = "blue",
           size = 5)



cor(CLASSGRADAVG$mean_class_size, CLASSGRADAVG$mean_grad) # -0.0815
cor(CLASSGRADAVGFILTER$mean_class_size, CLASSGRADAVGFILTER$mean_grad) # 0.0371
cor(SALARYGRADAVG$mean_salary, SALARYGRADAVG$mean_grad) # -0.0584
cor(SALARYGRADAVGFILTER$mean_salary, SALARYGRADAVGFILTER$mean_grad) # 0.1800



ggplot(cgmerge, aes(x=Average.Class.Size,y=Percent_Graduated)) + #Graph of Class Size for every district every year
  geom_point() +
  annotate("text", x = 50, y = 2,
           label = "Min of 100 Students",
           col = "blue",
           size = 5) +
  geom_smooth(method="lm", se=FALSE) +
  xlab("Average Class Size") +
  ylab("Percentage of Students Graduated") +
  ggtitle("Average Class Size vs Graduation Rate in MA School Districts 2011-2023") +
  scale_x_continuous(breaks = seq(0, 60, 10))

#Boston Day and Evening Academy Charter School Drop Out percentage ranges from 21.6 to 44.8
#Students in cohort range from 87 to 194


ggplot(sgmerge, aes(x=AverageSalaryInDollars,y=Percent_Graduated)) + #Graph of Salary for every district every year
  geom_point() +
  annotate("text", x = 40000, y = 2,
           label = "Min of 100 Students",
           col = "blue",
           size = 5) +
  geom_smooth(method="lm", se=FALSE)+
  xlab("Average Salary in Dollars") +
  ylab("Percent of Students Graduated") +
  ggtitle("Average Salarys of Teachers vs Graduation Rate in MA School Districts 2008-2021") +
  scale_x_continuous(breaks = seq(20000,130000,10000))

#Boston Day and Evening Academy Charter School reported their salary only twice, the averaged salary being 116,664$ and 136,349$
#The percent graduated was 5.3 and 6.0 respectively
  
cgmergeFILTERED = filter(cgmerge, Percent_Graduated > 50) #Filtering data set for entries with 50%< graduation rate for that year

ggplot(cgmergeFILTERED, aes(x=Average.Class.Size,y=Percent_Graduated)) + #Graph of Class Size Filtered
  geom_point() +
  annotate("text", x = 23, y = 55,
           label = "min of 100 students",
           col = "blue",
           size = 5) +
  annotate("text", x = 22.5, y = 52,
           label = "district with min 50% graduated",
           col = "blue",
           size = 5) +
  geom_smooth(method="lm", se=FALSE)

sgmergeFILTERED = filter(sgmerge, Percent_Graduated > 50)

ggplot(sgmergeFILTERED, aes(x=AverageSalaryInDollarsScaled,y=Percent_Graduated)) + #Graph of Salary for every district every year
  geom_point() +
  annotate("text", x = 0.75, y = 52,
           label = "Salary scaled from max salary of $136,349",
           col = "blue",
           size = 5) +
geom_smooth(method="lm", se=FALSE)

cor(sgmerge$AverageSalaryInDollars, sgmerge$Percent_Graduated) # 0.2309
cor(cgmerge$Average.Class.Size, cgmerge$Percent_Graduated) # -0.0661
cor(sgmergeFILTERED$AverageSalaryInDollars, sgmergeFILTERED$Percent_Graduated) # 0.2980
cor(cgmergeFILTERED$Average.Class.Size, cgmergeFILTERED$Percent_Graduated) # -0.0227


q = sgmerge[sgmerge$Year == "2019",]
p = cgmerge[cgmerge$Year == "2019",]


ggplot(q, aes(x=AverageSalaryInDollars, y=Percent_Graduated)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE)


ggplot(p, aes(x=Average.Class.Size, y=Percent_Graduated)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE)


pFILTERED = filter(p, Percent_Graduated > 55)


ggplot(pFILTERED, aes(x=Average.Class.Size, y=Percent_Graduated)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE)


cor(p$Average.Class.Size, p$Percent_Graduated) # -0.1265
cor(q$AverageSalaryInDollars, q$Percent_Graduated) # 0.2274
cor(pFILTERED$Average.Class.Size, pFILTERED$Percent_Graduated) # -0.0035





















