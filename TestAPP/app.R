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
    h2("Welcome to my web page!"),
    # a line
    strong("---------------------------------------------------------------------------------------------------------------------------"),
    # some info about me
    p("Bio: I received the Bachelor's and M.Sc. degrees of Electronic Engineering in 2004 and 2008, respectively. After finishing my Ph.D. degree in Electronics Engineering from the University of Southampton, United Kingdom, in 2012, I joined Japan Advanced Institute of Science and Technology, Japan, for my Japan Society for the Promotion of Science (JSPS) post-doctoral research fellowship. From 2013 to 2014, I was working at the Department of Electrical and Computer Engineering, National University of Singapore (NUS), Singapore, as a research fellow. In 2014, I joined the University of Sheffield, United Kingdom, as a post-doctoral research associate. After that, I continued my research at the Singapore Institute for Neurotechnology (SINAPSE), NUS, from 2016 to 2019. I received a prestigous JSPS invitational fellow at the University of Tokyo in 2019 to work at the laboratory of Prof. Takao Someya. My research interests include micro/nano-electronics, micro/nano-electromechanical hybrid devices and sensors for biological and chemical sensing applications, and energy harvesters."),
    # my linkedin page
    a("You can learn more about me by clicking here.", href = "https://www.linkedin.com/in/faezeh-arab-hassani-11318317b/"),
    # a widget
    textInput(inputId = "username", label = "Tell me your name?"),
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