
library(shiny)
library(shinyapps)
library(caret)
library(party)
library(randomForest)
data1<-read.csv("Data.csv")
train1<-train(Volume~Temperature+Humidity+Shop, data = data1, method="rf")
newdata<-read.csv("newdata.csv")
shinyServer(
  function(input,output){
    predicted<-reactive({
      output$inputValue<-renderPrint({input$Humidity})
      output$inputValue<-renderPrint({input$Temperature})
      output$inputValue<-renderPrint({input$ShopStatus})
      newdata$Temperature<-input$Temperature
      newdata$Humidity<-input$Humidity
      newdata$Shop<-input$Shop
      predict(train1, newdata=newdata)
    })
      output$Prediction<-renderPrint({paste(predicted())})
  }
)
