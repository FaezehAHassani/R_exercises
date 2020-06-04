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
     # layout
    page_one <- tabPanel(
        "Home",
        titlePanel("Short Bio"),
        sidebarLayout(
        sidebarPanel(
            p("Let me know you better!"),
            # a widget
            textInput(inputId = "username", label = "Tell me your name?"),
            # make a slider widget
            sliderInput(
                inputId = "age",
                label = "Do you mind if I ask your age?",
                min = 18,
                max = 80,
                value = 42
            ),
            # an output element
            textOutput(outputId = "message")
        ),
        mainPanel(
            # a second level header
            h2("Welcome to my web page!"),
            # a line
            strong("---------------------------------------------------------------------------------------------------------------------------"),
            # some info about me
            p(strong("Biography: "), "I received Bachelor and M.Sc. degrees of Electronic Engineering in 2004 and 2008, respectively. After finishing my Ph.D. degree in Electronics Engineering from the University of Southampton, United Kingdom, in 2012, I joined Japan Advanced Institute of Science and Technology, Japan, for my Japan Society for the Promotion of Science (JSPS) post-doctoral research fellowship. From 2013 to 2014, I was working at the Department of Electrical and Computer Engineering, National University of Singapore (NUS), Singapore, as a research fellow. In 2014, I joined the University of Sheffield, United Kingdom, as a post-doctoral research associate. After that, I continued my research at the Singapore Institute for Neurotechnology (SINAPSE), NUS, from 2016 to 2019. I received a prestigious JSPS invitational fellow at the University of Tokyo in 2019 to work at the laboratory of Prof. Takao Someya. My research interests include micro/nano-electronics, micro/nano-electromechanical hybrid devices, sensors, actuators, and energy harvesters for biomedical and environmental applications."),
            # my linkedin page
            a(strong("LinkedIn: "), "You can learn more about me by clicking here.", href = "https://www.linkedin.com/in/faezeh-arab-hassani-11318317b/")
        )
    )
))

# server takes input and output arguments
my_server <- function(input, output) {
    output$message <- renderText({
        message_str <- paste0("Hello ", input$username, ", ", "you ", "are ", input$age, " years ", "old!")
        message_str
    })
}

shinyApp(ui = my_ui, server = my_server)


