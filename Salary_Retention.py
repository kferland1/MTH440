#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Kate Ferland 
MTH 440

Code to read, merge, and plot average teacher salary vs teacher retention within MA school districts
using pandas to read the files and matplotlib and seaborn to visualize the data
"""

#import necessary packages
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#Read necessary excel files
reten = pd.read_excel('RetentionTotal.xlsx') #teacher retention data
salary = pd.read_excel('SalariesTotals.xlsx') #teacher salary data

#Merge data on district and year to match up data 
sal_reten = pd.merge(salary, reten, on=['District Code','Year'], how='inner')
sal_reten.to_excel('Salary_Retention.xlsx',index=False)

#Read excel file of data with retention rates below 80
# Excel was used to remove all rows with retention rates of 80 and above
sr = pd.read_excel("Salary_RetentionBelow80.xlsx")

#plot salary vs retention
sr.plot(kind='scatter', y ='Teacher % Retained',x='AverageSalaryInDollars') #scatterpplot
plt.yticks([0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100])
plt.xlabel("Average Teacher Salary", size = 10) # label x axis
plt.ylabel("Teacher Retention Rate", size = 10) # label y axis
plt.title('Teacher Retention Rate vs Average Salary in MA School Districts 2009-2023', size = 10) # add title
plt.savefig("SalaryvsRetention.png")
plt.show() # show graph in console

