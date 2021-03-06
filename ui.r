library(shiny)
library(shinyapps)
library(caret)
library(party)
library(randomForest)
shinyUI(pageWithSidebar(
  headerPanel("Sales volume prediction"),
  sidebarPanel(
    h4('Disclaimer: this model was made up and does not repredsent real trends. The fields below allow a business owner to predict daily sales volumes based on weather data and status of the shoe shop next door. Feel free to try different combinations of Temperature/Humidity/Shoe shop status'),
    numericInput("Humidity", 'Humidity, %',0,min = 35, max=100,step=1),
    numericInput("Temperature", 'Temperature, Celsius', 0 , min = 11, max=30,step=1),
    selectInput("Shop", label = "Shop", choices = list("Open", "Closed")),
    submitButton('Submit')
  ),
  
  mainPanel(
    h3('Based on weather forecast and shoe shop status, predicted volume of units sold for tomorrow is'),
    verbatimTextOutput('Prediction')
  )
))
