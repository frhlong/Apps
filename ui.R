# ui.R


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Neonatal Mortality Risk Assessment"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("temp",label=h3('Temperature'),37,28.4,39.5,0.1),
      numericInput("weight",label=h3('Admission Weight in kg(s)'),2.5,0.74,6,0.1),
      numericInput("age",label=h3('Admission Age',br(),'in day(s)'),2,0,28,1),
      numericInput("glucose",label=h3('Blood Glucose',br(),'(mmol/L)'),4.5,0.1,25.5,0.1),
      radioButtons("res", label = h3("Respiratory", br(),"Distress Category"),
                   choices = list("No sign" = "No sign of", "Mild" = "Mild",
                                  "Moderate" = "Moderate","Severe" = "Severe"),selected = "No sign of"),
      radioButtons("gest", label = h3("Gestation"),
                   choices = list("Preterm" = "Preterm", "Term" = "Term"),selected = "Term"),
      
      radioButtons("floppy", label = h3("Floppy?"),
                   choices = list("Yes" = "Is", "No" = "No"),selected = "No"),
      
      radioButtons("conab", label = h3("Congenital Abnormality?"),
                   choices = list("Yes" = "Has", "No" = "No"),selected = "No"),      
      radioButtons("seizure", label = h3("Seizure?"),
                   choices = list("Yes" = "Has", "No" = "No"),selected = "No"),
      radioButtons("apnoea", label = h3("Apnoea?"),
                   choices = list("Yes" = "Has", "No" = "No"),selected = "No")
      

      )   
    ,
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("What is this web application about?", align = "center"),
      h6("This web application is used to assess mortality risk of admitted neonates at the Angkor Hospital for Children in Siam Reap, Cambodia. The deployed model is based on the established neonatal severity score developed 
         using data of neonates admitted to the hospital and its satellite clinic from Dec 2011 to Dec 2012. The risk score and prediction would ultimately assist in the triage of neonates."),
      h3("How to use?", align = "center"),
      h6("Simply enter patient's conditions on the left panel and the prediction will automatically appear in the table below. Note that Death Probability leverages on conservative estimation while Survival Probablity is produced by liberal approach. The mortality
         prediction of death is generated if Survival Probability is not higher than Death Probability plus 0.15"),
      h3("Patient's condition summary", align = "center"),
      textOutput("text1"),
      h3("Risk assessment and prediction"),
      tabPanel('iris',
               dataTableOutput("mytable3"))
      )
  )
))