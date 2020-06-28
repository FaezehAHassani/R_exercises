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
            p(strong("Biography: "), "I, ", strong("Faezeh Arab Hassani, PhD, SMIEEE, JSAP Member"), ", received Bachelor and M.Sc. degrees of Electronic Engineering in 2004 and 2008, respectively. After finishing of Ph.D. degree in Electronics Engineering at the University of Southampton, United Kingdom, in 2012, I joined Japan Advanced Institute of Science and Technology, Japan, for my Japan Society for the Promotion of Science (JSPS) post-doctoral fellowship. From 2013 to 2014, I was working at the Department of Electrical and Computer Engineering (ECE), National University of Singapore (NUS), Singapore, as a research fellow. I then joined the University of Sheffield, United Kingdom, as a post-doctoral research associate till 2016. I continued my research as a research fellow at the N.1 Institute of Health (former Singapore Institute for Neurotechnology), NUS, till 2019. I received a prestigious JSPS invitational fellowship at the University of Tokyo in 2019 to conduct research at the laboratory of Prof. Takao Someya. I am currently a research fellow at ECE, NUS. My research interests include micro/nano-electronics, micro/nano-electromechanical-systems (MEMS/NEMS) hybrid devices, sensors, actuators, and energy harvesters for biomedical and environmental applications."),
            # my linkedin page
            a(strong("LinkedIn: "), "You can learn more about me by clicking here.", href = "https://www.linkedin.com/in/faezeh-arab-hassani-11318317b/")
        )
        )
    )
)
page_two <- tabPanel(
    "Publications",
    p(strong("Peer-reviewd journal papers")),
    p("1.	Hassani F. A., Jin H., Yokota T., Someya T., & Thakor, N. V. (2020). Soft sensors for a sensing-actuation system with high bladder voiding efficiency. Science Advances, 6(18), eaba0412."),
    p("2.	Hassani F. A., Mogan, R. P., Gammad, G. G. L., Wang, H., Yen, S. -C., Thakor, N. V., & Lee, C (2018). Toward self-control systems for a neurogenic underactive bladder− A triboelectric nanogenerator sensor integrated with a bi-stable micro-actuator. ACS Nano, 12(4), 3487-3501."),
    p("3.	Hassani F. A., Gammad, G. G. L., Mogan, R. P., Ng, T. K., Kuo, T. L. C., Ng, L. G., Luu, P., Thakor, N. V., Yen, S. -C., & Lee, C. (2018). Design and anchorage dependence of shape memory alloy actuators on enhanced voiding of a bladder. Advanced Materials Technologies, 3(1), 1700184."),
    p("4.	Hassani F. A., Peh, W. Y. X., Gammad, G. G. L, Mogan, R. P., Ng, T. K., Kuo, T. L. C., Ng, L. G., Luu, P., Yen, S. -C., & Lee, C. (2017). A 3D Printed implantable device for voiding the bladder using shape memory alloy (SMA) actuators. Advanced Science, 4(11), 1700143."),
    p("5.	Hassani, F. A., & Lee. C. (2015). A triboelectric energy harvester using low cost, flexible and biocompatible Ethylene Vinyl Acetate (EVA). IEEE/ASME Journal of Microelectromechanical Systems, 24(5), 1338-1345."),
    p("6.	Liu, H., Gudla, S., Hassani, F. A., Heng, C. H., Lian, Y., & Lee, C. (2014). Investigation of the nonlinear electromagnetic energy harvesters from hand shaking. IEEE Sensors Journal, 15(4), 2356-2364."),
    p("7.	Payam, A. F., Hassani, F. A., & Fathipour, M. (2014). Design of hybrid closed loop control systems for a MEMS accelerometer using nonlinear control principles. International Review of Aerospace Engineering, 7(5), 164-170."),
    p("8.	Hassani, F. A., Tsuchiya, Y., & Mizuta, H. (2013). Optimisation of quality-factor for in-plane free free nanoelectromechanical resonators. Micro & Nano Letters, 8(12), 886-889."),
    p("9.	Hassani, F. A., Tsuchiya, Y., & Mizuta, H. (2013). In-plane resonant nano-electro-mechanical sensors: A comprehensive study on design, fabrication and characterization challenges. Sensors, 13(3), 9364-9387."),
    p("10.	Hassani, F. A., Cobianu, C., Armini, S., Petrescu, V., Merken, P., Tsamados, D., Ionescu, A. M., Tsuchiya, Y., & Mizuta, H. (2011) Numerical analysis of zeptogram/Hz-level mass responsivity for in-plane resonant nano-electro-mechanical sensors. Microelectronic Engineering, 88 (9), 2879-2884."),
    p("11.	Cobianu, C., Serban, B., Petrescu, V., Pettine, J., Karabacak, D., Offerman, P., Brongesma, S., Cherman, V., Armini, S., Hassani, F. A., Ghiass, M. A., Tsuchiya Y., Mizuta, H., Durpe, C., Duraffourg, L., Koumela, A., Mercier, D., Ollier, E., Tsamados, D., & Ionescu, A. M. (2010). Towards nano-scale resonant gas sensors. Annals of the Academy of Romanian Scientists, Series on Science and Technology of Information, 3(2), 39-60."),
    p("12.	Hassani, F. A., Payam, A. F., & Fathipour, M. (2010). Design of a smart MEMS accelerometer using nonlinear control principles. Smart Structures and Systems, 6(1), 1-16."),
    p("13.	Maddahi, Y., & Hassani, F. A. (2004). Trajectory optimisation of a flexible manipulator using deflection analysis method. WSEAS Transactions on Circuits and Systems, 3(8), 1658-1661.")
)

my_ui <- navbarPage(
    "My webpage",
    page_one,
    page_two
)   

# server takes input and output arguments
my_server <- function(input, output) {
    output$message <- renderText({
        message_str <- paste0("Hello ", input$username, ", ", "you ", "are ", input$age, " years ", "old!")
        message_str
    })
}

shinyApp(ui = my_ui, server = my_server)


