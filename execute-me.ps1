#to run this you must agree to set execution policy to Unrestricted
#For more info on this command: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7
#Run Powershell as Administration and execute "Set-ExecutionPolicy Unrestricted"

#source:
#https://blog.expta.com/2017/03/how-to-self-elevate-powershell-script.html
# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
        Exit
    }
}

#Self elevate is to kill steam processes
#set this variable to your steam location
$steamLocation = "C:\Program Files (x86)\Steam"

#appID 730 is CSGO
#Find AppID here https://steamdb.info/apps/
$appID = "730"

#Kills Steam Processes
Stop-Process -force -processname SteamService
Stop-Process -force -processname steam
Stop-Process -force -processname steamwebhelper 

#Change Directory to Steam folder
Set-Location -Path $steamLocation

#Delete DLLs to be redownloaded
Remove-Item Steam.dll -Force
#Remove-Item SteamUI.dll -Force does not work, i mean wtf, right?
cmd.exe /c "del `"$steamLocation\SteamUI.dll`""

# https://developer.valvesoftware.com/wiki/Command_Line_Options#Steam_.28Windows.29
# -cafeapplaunch == Launch apps in a cyber cafe context (Forces apps to be verified / validated before launch). 
# -applaunch Launches an Game or Application through Steam. 
cmd.exe /c "`"$steamLocation\Steam.exe`" -cafeapplaunch -applaunch $appID"

#makes you wonder, why even bother with powershell, right?