gpmdata <- read_csv("Gapminder_data.csv")

# user interface
ui1 <- fluidPage(
  
  # application title
  titlePanel("Distribution of Life Expectancy by Year"),
  
  sidebarLayout(
    sidebarPanel(
      
      # input for year
      sliderInput(inputId = "year",
                  label = "Year:",
                  min = 1800,
                  max = 2020,
                  value = 1800)
    ),
    
    # show plot
    mainPanel(
      plotOutput("distPlot")
    )
  )
)


# server logic
server1 <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    # create plot
    ggplot(data = gpmdata %>% filter(year == input$year)) + 
      geom_histogram(aes(x = lifeExp), bins = 10, color="white", fill="blue") +
      xlab("Life Expectancy") + ylab("Frequency")
  })
}


# run the application 
shinyApp(ui = ui1, server = server1)
