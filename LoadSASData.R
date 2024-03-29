
# install.packages("sas7bdat")

library("sas7bdat")

# https://www.census.gov/programs-surveys/nsch/data/nsch2016.html
# https://www2.census.gov/programs-surveys/nsch/datasets/2016/nsch_2016_screener.sas

# fails because of compressed data
df <-  read.sas7bdat("nsch_2016_screener.sas7bdat", debug=FALSE)

# install.packages("haven")

library("haven")

# gives warning, but seems to work
# 124K observations
df <- read_sas("nsch_2016_screener.sas7bdat")





