#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Kate Ferland 
MTH 440

Code to read, merge, and plot graduation rate vs. per pupil expenditures within MA school districts
using pandas to read the files and matplotlib and seaborn to visualize the data
"""

#import necessary packages
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#Read excel files of necessary data
grad = pd.read_excel('GraduationTotal.xlsx') # graduation rate data
expend = pd.read_excel('ExpendituresTotals.xlsx') # per pupil expenditures data

#Merge data on district and year to match up data for each district per year
grad_expend = pd.merge(grad, expend, on=['District Code','Year'], how='inner')
grad_expend.to_excel('Graduation_Expenditures.xlsx',index=False)

#Read excel file of merged data
ge = pd.read_excel('Graduation_Expenditures.xlsx')

# Find maximum per pupil expenditure of all data and print
expend_max = grad_expend['In-District Expenditures per Pupil In Dollars'].max()
print(expend_max)

# assign data as x and y for correlation coefficient
xe2=ge["Expenditures"] #column in dataframe of per pupi expenditures
ye=ge['Percent_Graduated'] #column in df of graduation rate

# find correlation coefficient and print
ce = ge['In-District Expenditures per Pupil In Dollars'].corr(ge['Percent_Graduated'])
print("The correlation coeffecient between Per Pupil Expenditures and Graduation Rates is")
print(ce)

#Plot Per Pupil Expenditures 
ge.plot(kind='scatter', x ='Expenditures',y='Percent_Graduated') #scatterplot
sns.regplot(x=xe2, y=ye, ci=None, line_kws={"color": "red"}) # linear reg line
plt.yticks([0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100])
plt.ylabel("Percent of Students Graduated", size = 10) # label x axis
plt.xlabel("Per Pupil Expenditures (in 1000s of Dollars)", size = 10) # label y axis
plt.title('Per Pupil Expenditures vs. Graduation Rate in MA School Districts 2008-2023', size = 10) # add title
plt.savefig("GradvsExpenditures2.png")
plt.show() # show graph in console

