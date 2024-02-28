# IPv6AddressUpdater

IPv6AddressUpdater is an automated tool that uses a PowerShell script to monitor and periodically update the local machine's IPv6 address to GitHub or Gitee. This is particularly useful for users who require remote access with dynamic IP addresses.

## Features

- **Automated Synchronization**: Periodically detects and updates the IPv6 address.
- **Windows Platform Support**: Compatible with environments that support PowerShell.
- **SSH Support**: Synchronizes to GitHub or Gitee using SSH.

## Guide

To add the `powershell_script.ps1` PowerShell script to Windows Task Scheduler so that it can be run automatically at scheduled intervals, follow these steps:

1. Open **Task Scheduler**:
   - You can open Task Scheduler by searching for it in the Start menu, or by running `taskschd.msc` from the Run dialog (`Win + R` key combination).

2. Create a New Task:
   - In the Task Scheduler library, right-click and select **New Folder** to create a folder for your custom tasks (optional).
   - Right-click on the Task Scheduler Library or the new folder you just created, and choose **Create Task**.

3. Set General Options:
   - In the **General** tab, give your task a name and description.
   - Choose the security options suitable for your use case (e.g., "Run whether user is logged on or not" if you want the script to run even when you're not logged in).

4. Set Triggers:
   - Go to the **Triggers** tab and click **New**.
   - Set your trigger according to when you want the script to start (e.g., on a schedule, at log on, at startup).

5. Set Actions:
   - Switch to the **Actions** tab and click **New**.
   - Set the action to "Start a program".
   - In the "Program/script" box, type `powershell.exe`.
   - In the "Add arguments" box, type `-ExecutionPolicy Bypass -File "C:\Path\To\Your\powershell_script.ps1"` replacing `C:\Path\To\Your\powershell_script.ps1` with the full path to your script.

6. Set Conditions and Settings:
   - Configure any additional **Conditions** and **Settings** as per your requirement. For example, you can set the task to stop if it runs longer than a certain time, or manage the network connection usage.

7. Save the Task:
   - Click **OK** to save your new task.
   - If you selected "Run whether user is logged on or not", you will be prompted to enter the credentials of the user account that the task will run under.

8. Test the Task:
   - Find your task in the list, right-click it, and choose **Run** to test that it works correctly.
