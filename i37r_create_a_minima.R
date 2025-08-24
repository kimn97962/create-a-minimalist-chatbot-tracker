# i37r_create_a_minima.R

# Load necessary libraries
library( readr )
library( stringr )
library( lubridate )

# Set up chat log data frame
chat_log <- data.frame(
  timestamp = character(),
  user = character(),
  message = character(),
  stringsAsFactors = FALSE
)

# Function to add new chat message to log
add_message <- function(user, message) {
  new_message <- data.frame(
    timestamp = Sys.time(),
    user = user,
    message = message
  )
  chat_log <<- rbind(chat_log, new_message)
}

# Function to track and display chat metrics
track_metrics <- function() {
  total_messages <- nrow(chat_log)
  unique_users <- length(unique(chat_log$user))
  avg_messages_per_user <- total_messages / unique_users
  
  cat("Total Messages:", total_messages, "\n")
  cat("Unique Users:", unique_users, "\n")
  cat("Average Messages per User:", avg_messages_per_user, "\n")
}

# Interactive chat loop
while(TRUE) {
  user_input <- readline(prompt="Enter your message (or 'exit' to quit): ")
  
  if(user_input == "exit") {
    break
  }
  
  add_message("User", user_input)
  track_metrics()
}

# Save chat log to CSV file
write_csv(chat_log, "chat_log.csv")