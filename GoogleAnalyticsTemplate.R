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
client.secret <- "w6tqmMP-Ogc1fxWUWI3ZoSIp_TknUI"
token <- Auth(client.id,client.secret)

# Save the token object for future sessions
save(token,file="./token_file")