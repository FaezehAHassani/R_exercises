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
