# load dependencies

library(tidyverse)
library(dplyr)
library(ggplot2)

MC_mpg <- read.csv(file = "MechaCar_mpg.csv", check.names = F, stringsAsFactors = F) #read in CSV


# Plot - looking at the data
plt <- ggplot(MC_mpg, aes(x = ground_clearance, y = mpg))
plt + geom_point()

# Linear Regression - Single Multiple
lm(mpg ~ vehicle_weight + vehicle_length + spoiler_angle +
        ground_clearance + AWD, MC_mpg) #create linear model
summary(lm(mpg ~ vehicle_weight + vehicle_length + spoiler_angle +
             ground_clearance + AWD, MC_mpg)) #summarize linear model


#-----------------------------------------------------------------------------

s_coil <- read.csv(file = "Suspension_Coil.csv", check.names = F, stringsAsFactors = F) #read in CSV

total_summary <- s_coil %>% summarize(Mean = mean(PSI), Median = median(PSI),
                                      Variance = var(PSI), SD = sd(PSI))

lot_summary <- s_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI),
                                                                    Variance = var(PSI), SD = sd(PSI))
## T-tests

# Total t-test
t.test(s_coil$PSI, mu = 1500)

# Create a subset for each lot
lot1 <- subset(s_coil, Manufacturing_Lot == "Lot1")
lot2 <- subset(s_coil, Manufacturing_Lot == "Lot2")
lot3 <- subset(s_coil, Manufacturing_Lot == "Lot3")

# Run t-test on subsets
t.test(lot1$PSI, mu = 1500)
t.test(lot2$PSI, mu = 1500)
t.test(lot3$PSI, mu = 1500)

