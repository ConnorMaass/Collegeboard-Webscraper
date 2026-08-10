library(rvest)
library(chromote)

url <- "https://bigfuture.collegeboard.org/colleges/california-state-university-fullerton/academics"

b <- ChromoteSession$new()

# Navigate to the site
b$Page$navigate(url)

# Pause to let JS scripts finish running
Sys.sleep(5)

# Extract the DOM HTML AFTER JavaScript has rendered it
html_doc <- b$Runtime$evaluate("document.documentElement.outerHTML")$result$value

webpage <- read_html(html_doc)

webData <- webpage %>%
  html_node(".csp-ap-credit-policy-table") %>%
  html_table()


webData

b$close()
