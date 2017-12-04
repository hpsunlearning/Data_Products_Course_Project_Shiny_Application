#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Simulation for Central Limit Theorem"),
  
  sidebarLayout(
    sidebarPanel(
       sliderInput("n",
                   "Sample size:",
                   min = 3,
                   max = 100,
                   value = 30),
       sliderInput("sim_t",
                   "Experiment times:",
                   min = 10,
                   max = 1000,
                   value = 500),
       selectInput("distri", 
                   label = "Choose a distribution",
                   choices = list("Normal", "Exponential",
                                  "Poisson"),
                   selected = "Exponential")
       
    ),   

    mainPanel(
       tabsetPanel(
          tabPanel("Result", plotOutput("distPlot")),
          tabPanel("Ducument",
                   h3("About the Central Limit Theorem"),
                   p("The Central Limit Theorem(CLT) states that the sampling distribution of the sampling means approaches a normal distribution as the sample size gets larger — no matter what the shape of the population distribution. This fact holds especially true for sample sizes over 30. All this is saying is that as you take more samples, especially large ones, your graph of the sample means will look more like a normal distribution."),
                   h3("About this App"),
                   p("This App is testing CLT using different distribution of random number.You can try different sample size experiment times to see how CLT works.")
                   )
        )
    )
    
  )      
))
