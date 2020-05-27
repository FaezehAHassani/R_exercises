#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# call a fluidpage()
my_ui <- fluidPage(
    # a second level header
    h2("Greetings from Shiny"),
    # a widget
    textInput(inputId = "username", label = "What is your name?"),
    # an output element
    textOutput(outputId = "message")
)

# server takes input and output arguments
my_server <- function(input, output) {
    output$message <- renderText({
        message_str <- paste0("Hello ", input$username, "!")
        message_str
    })
}

shinyApp(ui = my_ui, server = my_server)