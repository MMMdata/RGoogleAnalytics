require(RGoogleAnalytics)
# Navigate to https://console.developers.google.com/project
# Create a New Project and Open it
# Navigate to APIs and ensure that the Analytics API is turned On for your project
# Navigate to Credentials and create a New Client ID
# Select Application Type – Installed Application

# Authorize the Google Analytics account
# This need not be executed in every session once the token object is created 
# and saved
client.id <- "334508710483-8m1pd797q9eqtpcqdhql970hk8121frk.apps.googleusercontent.com"
client.secret <- "r6oJjApSOowX1Z10Nz16AxGu"
token <- Auth(client.id,client.secret)

# Save the token object for future sessions
save(token,file="./token_file")

# Get the Sessions & Transactions for each Source/Medium sorted in 
# descending order by the Transactions

query.list <- Init(start.date = "2016-01-27",
                   end.date = "2016-02-24",
                   dimensions = "ga:pagePath",
                   metrics = "ga:uniquePageviews",
                   max.results = 10000,
                   sort = "-ga:uniquePageviews",
                   table.id = "ga:108638674")

# Create the Query Builder object so that the query parameters are validated
ga.query <- QueryBuilder(query.list)

# Extract the data and store it in a data-frame
ga.data <- GetReportData(ga.query, token)

# Sanity Check for column names
dimnames(ga.data)

# Check the size of the API Response
dim(ga.data)