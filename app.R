library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Normal Distribution P-value and X Converter"),
  
  sidebarLayout(
    sidebarPanel(
      # Input for x value, mean, and standard deviation
      numericInput("x_value", "X value:", value = 0, step = 0.01),
      numericInput("mean", "Mean:", value = 0, step = 0.01),
      numericInput("sd", "Standard Deviation:", value = 1, min = 0.1, step = 0.01),
      
      # Display corresponding p-value
      verbatimTextOutput("p_output"),
      
      hr(),
      
      # Input for p-value, mean, and standard deviation
      numericInput("p_input", "P-value (0 to 1):", value = 0.5, min = 0, max = 1, step = 0.01),
      
      # Display corresponding x value
      verbatimTextOutput("x_output")
    ),
    
    mainPanel(
      # Display plot
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  
  output$p_output <- renderText({
    p <- pnorm(input$x_value, mean = input$mean, sd = input$sd)
    paste("P-value:", round(p, 4))
  })
  
  output$x_output <- renderText({
    x <- qnorm(input$p_input, mean = input$mean, sd = input$sd)
    paste("X value:", round(x, 4))
  })
  
  output$distPlot <- renderPlot({
    data <- data.frame(x = seq(input$mean - 5*input$sd, input$mean + 5*input$sd, by = 0.1))
    data$y <- dnorm(data$x, mean = input$mean, sd = input$sd)
    
    p <- ggplot(data, aes(x = x, y = y)) +
      geom_line() +
      geom_area(data = data[data$x <= input$x_value, ], 
                aes(x = x, y = y), fill = "blue", alpha = 0.4) +
      labs(title = "Normal Distribution", 
           x = "X value", 
           y = "Density") +
      theme_minimal()
    
    return(p)
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
