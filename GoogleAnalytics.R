require(RGoogleAnalytics)
client.id <- "334508710483-8m1pd797q9eqtpcqdhql970hk8121frk.apps.googleusercontent.com"
client.secret <- "w6tqmMP-Ogc1fxWUWI3ZoSIp"
# Authorize the Google Analytics account
# This need not be executed in every session once the token object is created 
# and saved

token <- Auth(client.id,client.secret)

# Save the token object for future sessions
save(token,file="./GA-oAuth-token")

# In future sessions it can be loaded by running load("./token_file")

ValidateToken(token)

# Build a list of all the Query Parameters
query.list <- Init(start.date = "2015-05-01",
                   end.date = "2015-12-12",
                   dimensions = "ga:date,ga:pagePath,ga:hour,ga:medium",
                   metrics = "ga:sessions,ga:pageviews",
                   max.results = 10000,
                   sort = "-ga:date",
                   table.id = "ga:109331519")
# Create the Query Builder object so that the query parameters are validated
ga.query <- QueryBuilder(query.list)

# Extract the data and store it in a data-frame
ga.data <- GetReportData(ga.query, token, split_daywise = T)