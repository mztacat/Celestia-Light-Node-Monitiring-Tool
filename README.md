# Celestia-Light-Node-Monitoring-Tool
This is a Bash script for monitoring a server process and automatically restarting it in case of a failure. The script continuously checks the status of the process and sends notifications when it detects any issues.
</br></br></br>


# Requirements
- Install the `Celestia CLI` by downloading binary 
![image](https://user-images.githubusercontent.com/31314340/229268159-f6722089-4be4-4d88-8afb-baa910b86586.png)
- Use the `celestia version` to make sure it is properly installed, you will get the below
![image](https://user-images.githubusercontent.com/31314340/229268221-25b1d87b-5cb4-48e4-b5c3-3fdc45902ad1.png)
- Curl command-line tool install 
</br></br>


# How to Use
- Customize the script by editing the webhook URL and Celestia command to match your specific requirements. The webhook URL can be for services such as Discord or Telegram.
- Grant executable permission to the script by running the command `chmod +x celestia_monitor.sh`.
- Execute the script by running the command `./celestia_monitor.sh`.

