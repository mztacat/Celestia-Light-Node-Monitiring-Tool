#!/bin/bash

# Define the webhook URL
WEBHOOK_URL="https://your-webhook-url-here.com"

# Define the celestia command and process name
CELESTIA_CMD="celestia light start --core.ip <ip-address> --gateway --gateway.addr <ip-address> --gateway.port <port> --p2p.network blockspacerace"
PROCESS_NAME="celestia"

# Define the time to wait before checking the status again (in seconds)
WAIT_TIME=600 # 10 minutes

# Define the time to wait before checking the status again after a relaunch failure (in seconds)
RELAUNCH_WAIT_TIME=2700 # 45 minutes

# Initialize the last relaunch time
LAST_RELAUNCH_TIME=0

# Define the cleanup and initialization commands 
#CLEANUP_CMD="rm -r $HOME/.celestia-light-blockspacerace-0/data/"
#INIT_CMD="celestia light init --p2p.network blockspacerace"

# Function to send a webhook message
# This function sends a message to the webhook URL specified earlier
send_webhook() {
  message="$1"
  curl -H "Content-Type: application/json" -d "{\"content\":\"$message\"}" $WEBHOOK_URL
}

# Infinite loop to continuously monitor celestia process
# This loop checks whether the celestia process is running, and if not, relaunches it.
while true; do

  # Check if the celestia process is running
  if pgrep -c -x "$PROCESS_NAME" > /dev/null; then
    echo "celestia is running"
  else
    # If the celestia process is not running, relaunch it
    echo "celestia is not running, relaunching..."
    send_webhook "The celestia process has stopped."

    # Launch the celestia process
    #$CLEANUP_CMD &
    #$INIT_CMD 
    $CELESTIA_CMD &

    # Send the webhook to confirm the new process is running
    send_webhook "The celestia process has been relaunched."
    # Update the last relaunch time
    LAST_RELAUNCH_TIME=$(date +%s)
  fi

  # Check if the last relaunch was more than 45 minutes ago and the celestia process is still not running
  # If so, wait for 45 minutes before checking again
  if ! pgrep "$PROCESS_NAME" > /dev/null && [ $(($(date +%s) - LAST_RELAUNCH_TIME)) -ge $RELAUNCH_WAIT_TIME ]; then
    echo "celestia is still not running, waiting for 45 minutes before checking again"
    # Update the last relaunch time to prevent excessive checking
    LAST_RELAUNCH_TIME=$(date +%s)
    # Wait for 45 minutes before checking again
    sleep 2700
  else
    # Wait for the specified time (10 minutes) before checking the status again
    sleep $WAIT_TIME
  fi

done
