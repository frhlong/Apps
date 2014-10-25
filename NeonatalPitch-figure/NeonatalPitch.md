Neonatal Mortality Risk Assessment
========================================================
author: Francis Hoang Long Ngoc Nguyen 
date: 25-Oct-2014

Background
========================================================


The goal of the project is to develop a neonatal severity score to assist in the triage of neonates (infants less than 28 days of birth) at the Angkor Hospital for Children in Siam Reap, Cambodia. While several established scores, like the CRIB, SNAP, and PRISM scores are used in the developed world, they are not appropriate for the developing world because the measurements required are generally not available, necessitating the development of a simplified predictive model.


How are developed and developing worlds different in neonatal mortality? 
========================================================


```
                     Var1 Freq
19                 Sepsis  258
18            Prematurity   86
16                    PAT   78
21         Skin Infection   56
4  Congenital Abnormality   42
3          Birth Asphyxia   39
```
The commonest cause of death in Cambodia is Infection which including Sepsis (Blood Infection) and Skin Infection. This is due to poor hygiene condition at  birth delivery in the country. In contrast, majority of death happenes in developed countries is due to Congenital Abnormality.




Predictive Modeling
===
The predictive model is an ensemble of 3 models: Penalized Logistics Regression, Support Vector Machine and Bayesian Network. The classification results for train, test and validation are as follows:

Training Result

```
          
            OK dead
  PredDead  31  214
  PredOK   340   14
```
***
Test Result

```
          
            OK dead
  PredDead  24   22
  PredOK   138    9
```
Validation Result

```
          
             0   1
  PredDead  12   6
  PredOK   139   4
```


Web Application
===
left:50%
What is it about?

This web application is used to assess mortality risk of admitted neonates at the Angkor Hospital for Children in Siam Reap, Cambodia. The deployed model is based on the established predictive model described above. The risk score and prediction would ultimately assist in the triage of neonates.

***
How to use?

Simply enter patient's conditions on the left panel and the prediction will automatically appear in the table below. Note that Death Probability leverages on conservative estimation while Survival Probablity is produced by liberal approach. The mortality prediction of death is generated if Survival Probability is not higher than Death Probability plus 0.15.
