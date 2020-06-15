# building interactive web applications with shiny

- shiny is a web application framework for R. contrary to static webpages created by RMrakdown, shiny is a web application that is basically an interactive and dynamic webpage
- shiny allows passing content between R session and web browser
- shiny cor concepts
  - user interface (UI)
  - server (i.e. Rsession)
  - control widget
  - reactive output
  - render function
  - reactivity
- once you created a new file/ Shiny Web App, you name the folder under which you can save your web app as app.R

# some commands to add static content to your webpage

- h1("heading 1") : a first-level heading
- h2("heading 2") : a second-level heading
- p("some text") : a paragraph of plain text
- em("some text") : italic text
- strong("some text") : bold text
- a("some text", href = 'url') : a hyperlink
- img("description", src = "path") : an image

# dynamic inputs for basic widget

- textInput() : creates a box that user can enter textInput
- sliderInput(): creates a slider
- selectInput() : creates a dropdown menu
- checkboxInput() : creates a box that user can check
- radioButtons() : creates radio radioButtons
- the above take two arguments:
  - inputId (a string/name): that allows the server to access the widget
  - label (a string) : it will be shown alongside the widget
  - slider input requires a min, max, and starting value

# dynamic output

- textOutput() : display a plain text
- tableOutput() : display a data table similar to kable in RMarkdown
- plotOutput() : display a graphical output similar to ggplot
- verbatimTextOutput() : display content as formatted code block
- the above take outputId(a name)

# layout

- sidebarLayout() organizes content into two columns: sidebar and main section
- its requires two arguments: sidebarPanel() to mention the contents for sidebar and a mainPanel() that contains the content for main section
- you can use tabPanel() to assign several tab pages to a variable for an easier review

# render function (server) based on above dynamic outputId

- renderText()
- renderTable() or renderDataTable()
- renderPlot() or renderPlotly()
- renderLeaflet() : an interactive leaflet map
