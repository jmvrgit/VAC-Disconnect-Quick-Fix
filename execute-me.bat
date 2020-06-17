:: Set this variable to your Steam location
set steamLocation=C:\Program Files (x86)\Steam

:: appID 730 is CSGO
:: Find AppID here https://steamdb.info/apps/
set appID=730

::Kills Steam Processes
:: Microsoft Batch Command: taskkill
::https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/taskkill
taskkill /F /IM Steam.exe
taskkill /F /IM SteamService.exe
taskkill /F /IM steamwebhelper.exe

:: Change Directory to Steam folder
:: Microsoft Batch Command: cd
:: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cd
cd %steamLocation%

:: Delete DLLs to be redownloaded (force DL)
:: Microsoft Batch Command: del
:: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/del
del Steam.dll
del SteamUI.dll

:: Microsoft Batch Command: start
:: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/start

:: https://developer.valvesoftware.com/wiki/Command_Line_Options#Steam_.28Windows.29
:: -cafeapplaunch == Launch apps in a cyber cafe context (Forces apps to be verified / validated before launch). 
:: -applaunch Launches an Game or Application through Steam. 
start Steam.exe -cafeapplaunch -applaunch %appID%