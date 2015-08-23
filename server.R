library(shiny)

trainDataSet <- read.csv("./train.csv")

# Categorizing age : adult = 0 and minor = 1
trainDataSet$adult <- 0
trainDataSet$adult[trainDataSet$Age < 18] <- 1 

fit1 <- aggregate(Survived ~ adult + Pclass + Sex, 
                  data=trainDataSet, 
                  FUN=function(x) {sum(x)/length(x)})

names(fit1$Survived) <- "Chances of Survival(%)"

shinyServer(function(input, output) {
  
     output$survivalSummary <- 
      renderText({ 
        
        if (length(input$age)> 0 && input$age < 18)
        {
          trialAge <-1
        }
        else
        {
          trialAge <-0
        }
        print(trialAge)
        survivalChances <- subset(fit1, 
                                  fit1$Sex == input$gender & 
                                    fit1$Pclass == input$Pclass & 
                                    fit1$adult == trialAge)[[4]]*100 #percentage
        
        paste("Chances of Survival for a ",
                                input$gender,
                                " of age ", input$age,
                                " travelling in class ", input$Pclass,
                                " are ", round(survivalChances),"%",
                                "."
                                 )  
    })
  
      
})