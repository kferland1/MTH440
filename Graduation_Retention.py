#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Kate Ferland 
MTH 440

Code to read, merge, and plot graduation rate vs. teacher retention rate within MA school districts
using pandas to read the files and matplotlib and seaborn to visualize the data
"""

#import necessary packages
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#Read excel files of needed data
grad = pd.read_excel('GraduationTotal.xlsx') # Graduation data
reten = pd.read_excel('RetentionTotal.xlsx') # Teacher retention data

#Merge two files on district and year and upload as excel file
grad_reten = pd.merge(grad, reten, on=['District Code','Year'], how='inner')
grad_reten.to_excel('Graduation_Retention.xlsx',index=False)

#Read excel file of merged data
gr = pd.read_excel('Graduation_Retention.xlsx')

#Assign data as x and y for the linear regression line
xr=gr['Teacher Rate'] # column of teacher rates
yr=gr['Percent_Graduated'] # column of graduation rates

#Calculate and print correlation coefficient
cr = gr['Teacher Rate'].corr(gr['Percent_Graduated'])
print("The correlation coeffecient between Retention and Graduation Rates is")
print(cr)

#Plot Retention Rate vs Graduation Rate
gr.plot(kind='scatter', x ='Teacher Rate',y='Percent_Graduated') # scatterplot of data
sns.regplot(x=xr, y=yr, ci=None, line_kws={"color": "red"}) # Linear reg line
plt.xticks([0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100])
plt.yticks([0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100])
plt.ylabel("Percent of Students Graduated", size = 10) # label x axis
plt.xlabel("Teacher Retention Rate", size = 10) # label y axis
plt.title('Teacher Retention Rate vs Graduation Rate in MA School Districts 2009-2023', size = 10) # add title
plt.savefig("GradvsRetention.png")
plt.show() # show graph in console
