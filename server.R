library(shiny)


#-------------------- START SETUP --------------------#

### Read Map Data


## read calldata
load('data/LogFit.RData')
load('data/SC.rda')
load('data/SVMFit.RData')
load('data/TANFit.RData')
source('RScripts/imports.R')

shinyServer(function(input, output) {
    dataResult <- reactive({
      load('data/SC.rda')
      gestcat<-ifelse(input$gest=="Term",1,2)
      ageadmis  <-input$age       
      admiswt  <-input$weight         
      temp  <-input$temp       
      blglucose<-input$glucose  
      floppy <-ifelse(input$floppy=="No",0,1) 
      distresscat<-ifelse(input$res=="No sign of",0,ifelse(input$res=="Mild",1,ifelse(input$res=="Moderate",2,ifelse(input$res=="Severe",3)))) 
      conab  <-ifelse(input$conab=="No",0,1) 
      seizure <-ifelse(input$seizure=="No",0,1) 
      apnoea<-ifelse(input$apnoea=="No",0,1)
      data<-as.data.frame(cbind(gestcat,ageadmis,admiswt,temp,blglucose,floppy,distresscat,conab,seizure,apnoea))
      data$dead<-0
      data$gestcat <-as.factor(data$gestcat)
      data$floppy <-as.factor(data$floppy)
      data$distresscat <-as.factor(data$distresscat)
      data$conab  <-as.factor(data$conab )
      data$seizure <-as.factor(data$seizure)
      data$apnoea   <-as.factor(data$apnoea)
      data$ageadmis<-as.numeric(data$ageadmis)
      data$admiswt<-as.numeric(data$admiswt)
      data$temp<-as.numeric(data$temp)
      data$blglucose<-as.numeric(data$blglucose)
      data$dead    <-as.factor(data$dead )
      data<-predictShiny(data)
      data
    })
    
    output$text1 <- renderText({ 
      paste("Patient's objective clinical conditions are: Temperature (",input$temp
            ,'degree), Blood Glucose (', input$glucose,'mmol/L) and Weight (',input$weight,'kg). The admitted neonate is',
            input$age,'day(s) old and is',input$gest,'gestation. Subjective clinical conditions include:',input$res,'respiratory distress,',
            input$floppy,'floppy,',input$seizure,'seizure,',input$conab,'Congenital Abnormality and',input$apnoea,'apnoea.'
      )
    })
    output$mytable3 = renderDataTable({
      iris<-dataResult()
    }, options = list(aLengthMenu = c(5, 30, 50), iDisplayLength = 1))


    
  }
)