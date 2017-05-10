
library(shiny) 

 # Define UI for Fake Contacts Generator application 
 shinyUI(pageWithSidebar( 
     
    # Application title 
     headerPanel("Contacts Name Generator by Bijo Jose"), 
      
     # Left panel with control elements for Fake Contacts Generator 
     sidebarPanel( 
         h5("Please, choose gender for a specific gender list..."), 
       selectInput("gender", "Gender:", 
                                        list("All" = "all",  
                                                      "Male" = "male",  
                                                     "Female" = "female")), 
          
         h5("... and age range for list for an age group"), 
        sliderInput("age", "Age:", 
                                       min = 18, max = 65, value = c(25,45)), 
          
        checkboxInput("emailaddress", "Show email in final list", FALSE), 
        checkboxInput("telephonenumber", "Show phone in final list", FALSE) 
        
         
     ), 
      
     # Right panel with Fake Contacts List as table and bar chart for distribution 
    mainPanel( h2("The main purpose of this application is to create Fake Contacts list that could help some apllication testing"),
         h3("Contacts "), 
         dataTableOutput('dataTable'), 
        h3("Contacts by Age and Gender"), 
        h5(textOutput("caption")), 
         plotOutput("contactsPlot") 
       ) 
   )) 







