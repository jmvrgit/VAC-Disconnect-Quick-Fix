# CSGO Process Killer

    App ID 730 is CSGO

    Read the code before running it.

This code is a PowerShell script that kills Steam processes and deletes DLL files to force Steam to redownload them. It then launches a game or application through Steam using the cmd.exe command.

# Requirements

    Windows OS

# Usage

    To run this script, the execution policy in PowerShell must be set to Unrestricted. To do this, run PowerShell as Administrator and execute the command Set-ExecutionPolicy Unrestricted.

Then, navigate to the folder containing the script and execute it by typing .\scriptname.ps1 in PowerShell. or just right-click and run it as admin

Same applies with the batch file

When executed, the script will prompt for administrative privileges if required.

    The Stop-Process command kills Steam processes running in the background.
    The Remove-Item command deletes DLL files to force Steam to redownload them.
    The cmd.exe command is used to launch a game or application through Steam with the specified appID variable.