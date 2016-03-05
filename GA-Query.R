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