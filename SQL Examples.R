# no claim that any of this is original code
# lifted in learning exercises over time
# the RStudio editor will code fold the examples below

# Connect to MSSQL from Windows -------------------------------------------

# odbc is recommended and seems to work with the "Connections" window in RStudio
library(odbc)

# setup DSN in ODBC Windows
SERVER <- "tbd"
DSN_NAME <- "dsn_tbd"
USERNAME <- "username_tbd"
entered_pwd <- rstudioapi::askForPassword("Database password")

dbABLE = dbConnect(odbc(), dsn = DSN_NAME, Uid = USERNAME, Pwd = entered_pwd)

# Fiddling with SQLite ----------------------------------------------------

library(RSQLite)

# Load the mtcars as an R data frame put the row names as a column, and print the header.
data("mtcars")
mtcars$car_names <- rownames(mtcars)
rownames(mtcars) <- c()
head(mtcars)

db <- dbConnect(SQLite(), "CarsDB.db")

dbWriteTable(db, "cars_data", mtcars)

dbGetQuery(db, "SELECT * FROM cars_data LIMIT 10")

# simple concatenate example - notice escaped single quotes around DELETE_CAR
DELETE_CAR <- "Mazda RX4"
query_example <- paste0("DELETE FROM cars_data ",
                        "WHERE car_names = '",
                        DELETE_CAR,
                        "'")

dbExecute(db, query_example)

dbGetQuery(db, "SELECT * FROM cars_data LIMIT 10")

dbExecute(db, "INSERT INTO cars_data VALUES (21.0,6,160.0,110,3.90,2.620,16.46,0,1,4,4,'Mazda RX4')")

dbGetQuery(db, "SELECT * FROM cars_data")

dbListTables(db)

dbDisconnect(db)
