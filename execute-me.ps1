#to run this you must agree to set execution policy to Unrestricted
#For more info on this command: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7
#Run Powershell as Administration and execute "Set-ExecutionPolicy Unrestricted"

#set this variable to your steam location
$steamLocation = "C:\Program Files (x86)\Steam"

#appID 730 is CSGO
#Find AppID here https://steamdb.info/apps/
$appID = "730"

#Kills Steam Processes
Stop-Process -force -processname steam
Stop-Process -force -processname SteamService
Stop-Process -force -processname steamwebhelper 

#Change Directory to Steam folder
Set-Location -Path $steamLocation

#Delete DLLs to be redownloaded (force DL)
Remove-Item Steam.dll
Remove-Item SteamUI.dll

# https://developer.valvesoftware.com/wiki/Command_Line_Options#Steam_.28Windows.29
# -cafeapplaunch == Launch apps in a cyber cafe context (Forces apps to be verified / validated before launch). 
# -applaunch Launches an Game or Application through Steam. 
$args = "-cafeapplaunch -applaunch $appID"
& $steamLocation\steam.exe $args