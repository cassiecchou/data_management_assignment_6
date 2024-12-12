# 12/11/2024
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

# Code
wws02 <- wws01
wws02 <- wws02 %>% mutate(plavg = (pl1 + pl2 + pl3 + pl4 + pl5)/5, 
                          bpavg = (bp1 + bp2 + bp3 + bp4 + bp5)/5,
                          plavg_hilo = cut(plavg, breaks= c(0, 90, Inf), labels=c("low","high")))
summary(wws02$plavg_hilo)
str(wws02$plavg_hilo)

# Changes Confirmed by the Site
wws02 <- wws02 %>% mutate(collgrad = replace(collgrad, idcode == 15, 0),
                          age = replace(age, idcode == 227, 38),
                          married = replace(married, idcode == 354, 1),
                          age = replace(age, idcode == 492, 40),
                          collgrad = replace(collgrad, idcode == 714, 0)
                          )

# End of R file
# Save the workspace with the data
save.image(file="wws02.RData")

