# Celestia-Light-Node-Monitoring-Tool
This is a Bash script for monitoring a server process and automatically restarting it in case of a failure. The script continuously checks the status of the process and sends notifications when it detects any issues.
</br></br></br>


# Requirements
- Install the `Celestia CLI` by downloading binary 
![image](https://user-images.githubusercontent.com/31314340/229268159-f6722089-4be4-4d88-8afb-baa910b86586.png)
- Use the `celestia version` to make sure it is properly installed, you will get the below
![image](https://user-images.githubusercontent.com/31314340/229268221-25b1d87b-5cb4-48e4-b5c3-3fdc45902ad1.png)
- Curl command-line tool install 
- How to install *CURL*.    use `sudo apt-get update`   and `sudo apt-get install curl`

</br></br>

# Functionality
The script will log the status of the Celestia process and notify you through a webhook when it goes down or is relaunched. It includes customizable settings such as the wait time between status checks and the path to the Celestia command.
</br></br>

# How to Use
- Customize the script by editing the webhook URL and Celestia command to match your specific requirements. The webhook URL can be for services such as Discord or Telegram.
- Grant executable permission to the script by running the command `chmod +x celestia_monitor.sh`.
- Execute the script by running the command `./celestia_monitor.sh`.


CONFIG: 
`WEBHOOK_URL`: The URL of the webhook to send notifications to.
`CELESTIA_CMD`: The command to start the Celestia light node process.
`WAIT_TIME`: The time to wait (in seconds) before checking the Celestia process status again.
`RELAUNCH_WAIT_TIME`: The time to wait (in seconds) before attempting to relaunch Celestia after a failure.



# NOTE
The script defines configuration options including the webhook URL for notifications, the command to start the Celestia light node process, the wait time before checking the Celestia process status again, and the wait time before attempting to relaunch the process after a failure. The script continuously monitors the Celestia process and relaunches it if it is not running. It also sends a webhook message when the process stops or is relaunched. The script includes functions to clean up and initialize Celestia if needed.


# Twitter @mztacat if you face any issues
