# 10/15/2002
# Cassie Chou
# Assignment #6 - wws01 
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

# Add your code below
wws_df <- import("wws.csv")
cardio_wide1_df <- import("cardio_wide1.csv")
wws01 <- wws_df %>% left_join(cardio_wide1_df, by = "idcode")


# End of R file
# Save the workspace with the data
save.image(file="wws01.RData")

