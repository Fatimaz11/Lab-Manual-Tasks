library(dplyr)
library(ggplot2)
library(caret)
library(rpart)
library(rpart.plot)

# Load dataset
data(iris)
iris <- iris %>% mutate(Species = as.factor(Species))

# Train decision tree model
train_control <- trainControl(method = "cv", number = 5)
dt_model <- train(Species ~ ., data = iris, method = "rpart", trControl = train_control)

# Generate grid for visualization
grid_data <- expand.grid(
  Sepal.Length = seq(range(iris$Sepal.Length)[1], range(iris$Sepal.Length)[2], length.out = 100),
  Sepal.Width = seq(range(iris$Sepal.Width)[1], range(iris$Sepal.Width)[2], length.out = 100)
)

# Assign mean values for other features
grid_data <- grid_data %>%
  mutate(Petal.Length = mean(iris$Petal.Length),
         Petal.Width = mean(iris$Petal.Width))

# Make predictions
grid_data$Species <- predict(dt_model, newdata = grid_data)

# Plot results
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  geom_tile(data = grid_data, aes(fill = Species, alpha = 0.4), color = NA) +
  scale_fill_viridis_d() +  # Change color scheme
  scale_alpha(guide = "none") +
  labs(title = "Decision Tree Classification Boundaries",
       x = "Sepal Length", y = "Sepal Width") +
  theme_classic()
