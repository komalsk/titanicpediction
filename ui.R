library(shiny)
#https://komalkukreja.shinyapps.io/titanicprediction
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting Titanic Passenger Survival"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("gender", label = h3("Gender"), 
                  choices = list("Male" = "male", "Female" = "female"
                          ), selected = 1),
      numericInput("age", 
                   label = h3("Age"), 
                   value = 22),
      
      radioButtons("Pclass", label = h3("Passenger Class"),
                   choices = list("Class 1" = 1, "Class 2" = 2,
                                  "Class 3" = 3),selected = 1)
    ),
    
      
    
    
    # Show a plot of the generated distribution
    mainPanel(
      tags$blockquote(textOutput("survivalSummary"))
    )
  )
))