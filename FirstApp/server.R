#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    n <- input$n
    sim_t <- input$sim_t 
    distri <- input$distri
    
    if(distri=="Normal") {
        sample_mean <- NULL
        for (i in 1:sim_t) {
            sample_mean <- c(sample_mean, mean(rnorm(n)))
        }
        hist(sample_mean,prob=TRUE,main="Histogram of Sample Mean",xlab="")
        lines(density(sample_mean),lwd=3,col="blue")
        curve(dnorm(x,mean=mean(sample_mean), sd=sd(sample_mean)),add = T,col="red",lwd=3,lty=2,yaxt="n")
        legend("topright",c("Real density","Normal distribution"),lwd=3,cex=0.7,lty=c(1,2),col=c("blue","red"))

    }else if (distri=="Exponential") {
        sample_mean <- NULL
        for (i in 1:sim_t){
            sample_mean <- c(sample_mean, mean(rexp(n)))
        }
        hist(sample_mean,prob=TRUE,main="Histogram of Sample Mean",xlab="")
        lines(density(sample_mean),lwd=3,col="blue")
        curve(dnorm(x,mean=mean(sample_mean), sd=sd(sample_mean)),add = T,col="red",lwd=3,lty=2,yaxt="n")
        legend("topright",c("Real density","Normal distribution"),lwd=3,cex=0.7,lty=c(1,2),col=c("blue","red"))
        
    }else if (distri=="Poisson") {
        sample_mean <- NULL
        for (i in 1:10000){
            sample_mean <- c(sample_mean, mean(rpois(n,lambda=1)))
        }
        hist(sample_mean,prob=TRUE,main="Histogram of Sample Mean",xlab="")
        lines(density(sample_mean),lwd=3,col="blue")
        curve(dnorm(x,mean=mean(sample_mean), sd=sd(sample_mean)),add = T,col="red",lwd=3,lty=2,yaxt="n")
        legend("topright",c("Real density","Normal distribution"),lwd=3,cex=0.7,lty=c(1,2),col=c("blue","red"))
        
    }
    
  })
  
})
