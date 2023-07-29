
library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Exploratory Analysis of In-built R Datasets"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            
            selectInput("inbuilt_datasets", label = "Select Your prefered In-built dataset to explore", 
                      choices = ls(package:datasets))
        ),
        
        # Button
        downloadButton("downloadData", "Download"),
            
        # Show a plot of the generated distribution
        mainPanel(
          tabsetPanel(type = "tab",
                      tabPanel("Data", tableOutput("dat")),
                      tabPanel("Columns", tableOutput("col_names")),
                      tabPanel("Summary", dataTableOutput("summary"))
            )

            # plotOutput("distPlot")
        )
    )
)
