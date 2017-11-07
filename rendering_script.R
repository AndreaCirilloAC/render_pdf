n <- 200

data <- data.frame(a = sample(letters,size = n, replace = TRUE),
                   b = seq(1:n))

rmarkdown::render("template.Rmd", params = list(
  vector = seq(1:100)
))
