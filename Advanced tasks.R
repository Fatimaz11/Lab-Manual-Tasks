#To parse and format dates
install.packages("lubridate")
library(lubridate)
date_str <- "2025-03-18"
parsed_date <- ymd(date_str)
formatted_date <- format(parsed_date, "%B %d, %Y")
print(formatted_date)

#scraping data
install.packages("rvest")
library(rvest)
url <- "https://example.com"  # Replace with a real URL
webpage <- read_html(url)
# Extract text from a specific HTML node
title <- webpage %>% html_nodes("h1") %>% html_text()
print(title)

#Creating simple classification model
install.packages("caret")
library(caret)
# Load dataset
data(iris)
# Train a simple classification model
model <- train(Species ~ ., data = iris, method = "rpart")
print(model)

#visualization time-series data
install.packages(c("xts", "zoo"))
library(xts)
library(zoo)
# Create a time series object
dates <- as.Date("2025-01-01") + 0:9
values <- rnorm(10)
ts_data <- xts(values, order.by = dates)
# Plot the time series
plot(ts_data, type = "l", main = "Time Series Data")

