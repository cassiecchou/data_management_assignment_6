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
load(file = "wws02.RData")
cardio_wide2 <- import("cardio_wide2.csv")

# Code
wws03 <- wws02
wws03 <- wws03 %>% mutate(bp1 = replace(bp1, match(cardio_wide2$idcode,idcode), cardio_wide2$bp1),
                          bp2 = replace(bp2, match(cardio_wide2$idcode,idcode), cardio_wide2$bp2),
                          bp3 = replace(bp3, match(cardio_wide2$idcode,idcode), cardio_wide2$bp3),
                          bp4 = replace(bp4, match(cardio_wide2$idcode,idcode), cardio_wide2$bp4),
                          bp5 = replace(bp5, match(cardio_wide2$idcode,idcode), cardio_wide2$bp5),
                          pl1 = replace(pl1, match(cardio_wide2$idcode,idcode), cardio_wide2$pl1),
                          pl2 = replace(pl2, match(cardio_wide2$idcode,idcode), cardio_wide2$pl2),
                          pl3 = replace(pl3, match(cardio_wide2$idcode,idcode), cardio_wide2$pl3),
                          pl4 = replace(pl4, match(cardio_wide2$idcode,idcode), cardio_wide2$pl4),
                          pl5 = replace(pl5, match(cardio_wide2$idcode,idcode), cardio_wide2$pl5))

wws03 <- wws03 %>% mutate(plavg = (pl1 + pl2 + pl3 + pl4 + pl5)/5, 
                          bpavg = (bp1 + bp2 + bp3 + bp4 + bp5)/5,
                          plavg_hilo = cut(plavg, breaks= c(0, 90, Inf), labels=c("low","high")))

# Changes confirmed by site
wws03 <- wws03 %>% mutate(married = replace(married, idcode == 2377, 1),
                          age = replace(age, idcode == 2394, 27),
                          collgrad = replace(collgrad, idcode == 2886, 0),
                          age = replace(age, idcode == 4102, 26),
                          collgrad = replace(collgrad, idcode == 4248, 0)
                          )

# End of R file
# Save the workspace with the data
save.image(file="wws03.RData")

