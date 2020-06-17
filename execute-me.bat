set steamLocation=C:\Program Files (x86)\Steam

taskkill /F /IM Steam.exe
taskkill /F /IM SteamService.exe
taskkill /F /IM steamwebhelper.exe

cd %steamLocation%

del Steam.dll
del SteamUI.dll
del clientregistry.blob

start Steam.exe