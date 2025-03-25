#ggplot
install.packages("ggplot2")
library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point()

#dplyr and iris dataset
install.packages("dplyr")
library(dplyr)
iris_filtered <- iris %>%
  filter(Species == "setosa") %>%
  arrange(Sepal.Length)
print(iris_filtered)

#tidyr installation and pivot data
install.packages("tidyr")
library(tidyr)
# Create a sample dataset
df <- data.frame(ID = 1:3, Math = c(90, 80, 85), Science = c(88, 75, 92))
# Wide to long format
long_df <- df %>%
  pivot_longer(cols = c(Math, Science), names_to = "Subject", values_to = "Score")
print(long_df)
# Long to wide format
wide_df <- long_df %>%
  pivot_wider(names_from = Subject, values_from = Score)
print(wide_df)

#exporting data.table
install.packages("data.table")
library(data.table)
dt <- data.table(Name = c("A", "B", "A", "B"), Score = c(50, 60, 70, 80))
# Aggregation: Average Score by Name
dt_avg <- dt[, .(Avg_Score = mean(Score)), by = Name]
print(dt_avg)

