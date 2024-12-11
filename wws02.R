# 10/15/2002
# Cassie Chou
# Assignment #6 - wws02
#
# Make use of comments to be clear about the steps in the script and to 
# document the data management steps.
##########################################################################

# Install dependencies ====
# The pacman package installs any missing packages AND loads them.

pacman::p_load(
  tidyverse,  # Data management
  skimr,      # Review data
  janitor,    # Data cleaning
  rio,        # Data import
  lubridate,  # Manipulate dates
  Hmisc      # Data tools
)

# Load R Script
load(file = "wws01.RData")

# Add your code below
wws02 <- wws01

# End of R file
# Save the workspace with the data
save.image(file="wws01.RData")

