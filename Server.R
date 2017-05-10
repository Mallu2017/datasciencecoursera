# Main idea of this application is to create Fake Contacts List that could help into some apllication testing

library(shiny) 
 # Load data 
 data <- read.csv("individuals-fake-data-p2.csv", nrows = 5000, header = TRUE) 
 data$Gender <- as.factor(data$Gender) 
 

 # Create shiny server 
 shinyServer(function(input, output) { 
      
     # Data filtering reaction on input parameters including email and telephone
     dataFilter <- reactive({ 
        paste0("data[data$Age > ", input$age[1], " & data$Age < ", input$age[2],  
                          ifelse(input$gender != "all", paste0(" & data$Gender == '", input$gender, "'"), ""), ", c(2,5,7,21,", 
                         ifelse(input$emailaddress == TRUE, "13,", ""), 
                           ifelse(input$telephonenumber == TRUE, "17,", ""), "20) ]") 
       }) 
      
     # Data filtering 
        output$dataTable <- renderDataTable({ 
        eval(parse(text = dataFilter())) 
        }) 
         
       # Data filtering as a caption 
        output$caption <- renderText({ 
          dataFilter() 
         }) 
      
       # Plot rendering 
       output$contactsPlot <- renderPlot({ 
         data1 <- eval(parse(text = dataFilter()))
         boxplot(data$Age ~ data$Gender, data = data1, xlab = "Gender", ylab = "Age", col = c("red", "blue")) 
        }) 
         
     }) 
 
 
 