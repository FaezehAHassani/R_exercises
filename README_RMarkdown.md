# Dynamic reports and R Markdown

- R Markdown is a tool for sharing and compiling your results
- It can create websites (.html files), reports (.pdf files) and slideshows (using ioslides or slidy)
- R Markdown documents are created by two components: rmarkdown and knitr
- Create .Rmd files from File/ New File/ R Markdown, you can choose your file type (e.g. HTML, PDF, Word) and add a title and author's name for it, then save the file with .Rmd extension
- The .Rmd file consists of three sections:
  - header: contains title, author, date, and you can add table of contents here
  - Markdown content: it is similar to writing in Markdown
  - R code chunks: segments of R codes that can be evaluated and rendered. You can add them by **```{r}```**
  - you can put a name (i.e. options_example) for your R code chunk after r like: **```{r options_example, echo = FLASE, message = TRUE, include = FALSE}```**, this will help the debugging process
    - echo: used to say if the R code should be shown in the report
    - message: used to say if the results of any `print` command should be shown in the report
    - include: used to say if the output of R codes should be shown in the report
    - ```r``` if you don't want to run R code chunks
  - after finishing of your file, press "Knit" so it generates the html file in the same folder of your .Rmd file
- it is better you have a separate .R file with your codes then use source() to call the file in .Rmd file
- in your Markdown content if you use `r` what ever you write after r will be executed. for example `r 3 + 4` will show 7 in the report
