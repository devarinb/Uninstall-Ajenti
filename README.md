## **Uninstall.sh**

This script is designed to facilitate the removal of Ajenti, an open-source web-based control panel, from your Debian or Ubuntu server. It will stop the Ajenti service, uninstall Ajenti plugins, and remove related files and configurations.


## **Instructions**

Follow these steps to use the `uninstall.sh` script:

Download the Script: Download the `uninstall.sh` script from this repository to your server. You can use the following command to clone the repository:

`git clone https://github.com/devarinb/uninstall-Ajenti.git.git`

`cd uninstall-Ajenti`

Ensure Root Privileges: Make sure you have root (superuser) privileges to execute the script. If you are not logged in as the root user, use the sudo command to run the script:

`sudo bash uninstall.sh`

Install Dependencies (if needed): The script requires the `lsb-release` package to identify your distribution accurately. If the package is not already installed, the script will attempt to install it. However, if you encounter any issues during installation, you may need to install `lsb-release` manually.

Review Output: During execution, the script will display the detected OS and distribution. It will then stop the Ajenti service, uninstall Ajenti plugins, and remove related files and configurations.

Verify Uninstallation: After the script completes successfully, verify that Ajenti has been uninstalled from your system.

Note: Always review the script's content before executing it to ensure it aligns with your requirements. Additionally, please exercise caution while running scripts with root privileges, as they can significantly impact your system.


## **Compatibility**

The `uninstall.sh` script is designed explicitly for Debian and Ubuntu distributions. It may not work correctly on other operating systems. Please ensure you are using it on a supported platform.


## **Disclaimer**

This script is provided as-is without any warranty. The author is not liable for any potential damage caused by using this script. It is recommended to take backups of critical data before executing the script.

If you encounter any issues or have suggestions for improvement, feel free to create an issue or submit a pull request on the GitHub repository.
