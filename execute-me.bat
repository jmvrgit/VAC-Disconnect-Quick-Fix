:: Set this variable to your Steam location
set steamLocation=C:\Program Files (x86)\Steam

:: appID 730 is CSGO
:: Find AppID here https://steamdb.info/apps/
set appID=730

::Kills Steam Processes
taskkill /F /IM Steam.exe
taskkill /F /IM SteamService.exe
taskkill /F /IM steamwebhelper.exe

:: Change Directory to Steam folder
cd %steamLocation%

:: Delete DLLs to be redownloaded (force DL)
del Steam.dll
del SteamUI.dll

:: Start CSGO
:: https://developer.valvesoftware.com/wiki/Command_Line_Options#Steam_.28Windows.29
:: -cafeapplaunch == Launch apps in a cyber cafe context (Forces apps to be verified / validated before launch). 
:: -applaunch Launches an Game or Application through Steam. 
start Steam.exe -cafeapplaunch -applaunch %appID%