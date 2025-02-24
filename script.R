library(dplyr)
library(ggplot2)
table(LFS.PUF.December.2023$PUFC05_AGE)
#Create a variable for age group
LFS.PUF.December.2023 <- LFS.PUF.December.2023 %>% 
  mutate(agegroup = case_when(
    PUFC05_AGE < 15 ~ "0-14",
    PUFC05_AGE < 25 ~ "15-24",
    PUFC05_AGE < 35 ~ "25-34",
    PUFC05_AGE < 45 ~ "35-44",
    PUFC05_AGE < 55 ~ "45-54",
    PUFC05_AGE < 65 ~ "55-64",
    PUFC05_AGE > 64 ~ "65 and over"
  ))
table(LFS.PUF.December.2023$agegroup)

#fix the variable for education
LFS.PUF.December.2023 <- LFS.PUF.December.2023 %>%
  mutate(education = case_when(
    PUFC07_GRADE < 10011 ~ "no school",
    PUFC07_GRADE < 24011 ~ "elementary graduate",
    PUFC07_GRADE < 34011 ~ "junior high graduate",
    PUFC07_GRADE < 40001 ~ "senior high graduate",
    PUFC07_GRADE < 60000 ~ "post secondary graduate",
    PUFC07_GRADE > 59999 ~ "college"
  ))
table(LFS.PUF.December.2023$education)
#add the workstatus variable as factors
LFS.PUF.December.2023 <- LFS.PUF.December.2023 %>%
  mutate(workindicator = 
           ifelse(PUFC09_WORK==1,"working","not working" ))

#check for values
