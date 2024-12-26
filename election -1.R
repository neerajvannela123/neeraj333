rm (list = ls())

elections <- read.csv("2020 November General Election - Turnout Rates.csv", header = TRUE)

head(elections)
getwd()

required_packages <- c("ggplot2", "dplyr", "tidyr", "corrplot")

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
    library(pkg, character.only = TRUE)
  } else {
    library(pkg, character.only = TRUE)
  }
}

print("All required packages are successfully installed and loaded.")

install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("corrplot")


library(ggplot2)
library(dplyr)
library(tidyr)
library(corrplot)

colnames(elections)

str(elections)

elections$Vote.for.Highest.Office..President. <- as.numeric(gsub(",", "", elections$Vote.for.Highest.Office..President.))
elections$VEP.Turnout.Rate <- as.numeric(gsub("%", "", elections$VEP.Turnout.Rate))

elections <- elections %>%
  filter(!is.na(Vote.for.Highest.Office..President.), !is.na(VEP.Turnout.Rate))

#1.  
#a)
elections$Vote.for.Highest.Office..President. <- as.numeric(gsub(",", "", elections$Vote.for.Highest.Office..President.))
elections$VEP.Turnout.Rate <- as.numeric(gsub("%", "", elections$VEP.Turnout.Rate))

ggplot(elections, aes(x = Vote.for.Highest.Office..President., y = VEP.Turnout.Rate)) +
  geom_point() +  # Plot points
  geom_smooth(method = "lm", se = FALSE) +  
  labs(x = "Votes for Highest Office (President)", y = "VEP Turnout Rate (%)") +
  theme_minimal()


#b)
elections$VEP.Turnout.Rate <- as.numeric(gsub("%", "", elections$VEP.Turnout.Rate))

# Create the histogram with density overlay and title
ggplot(elections, aes(x = VEP.Turnout.Rate)) +
  geom_histogram(aes(y = ..density..), bins = 30, fill = "skyblue", color = "black") +  # Histogram plot
  geom_density(color = "red") +  # Density curve
  labs(
    title = "Distribution of VEP Turnout Rate Across States in the 2020 U.S. Election",  # Added title
    x = "VEP Turnout Rate (%)",
    y = "Density"
  ) +
  theme_minimal()




