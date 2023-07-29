
library(shiny)
library(datasets)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  dataset <- reactive({
    get(input$inbuilt_datasets, "package:datasets")
  })
  
  output$dat <- renderTable({
    dataset()
  })
  output$col_names <- renderTable({
    print(names(dataset()))
  })
  
  output$summary <- renderDataTable({
    # Use a reactive expression by calling it like a function
    summary(dataset())
  })
  
  # Downloadable csv of selected dataset ----
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(input$inbuilt_datasets, ".csv", sep = "")
    },
    content = function(file) {
      write.csv(dataset(), file, row.names = FALSE)
    } 
  )


    # output$distPlot <- renderPlot({
    # 
    #     # generate bins based on input$bins from ui.R
    #     x    <- faithful[, 2]
    #     bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # 
    #     # draw the histogram with the specified number of bins
    #     hist(x, breaks = bins, col = 'darkgray', border = 'white',
    #          xlab = 'Waiting time to next eruption (in mins)',
    #          main = 'Histogram of waiting times')
    # 
    # })

}
