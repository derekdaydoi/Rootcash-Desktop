@echo off
rem Mo Rootcash trong cua so rieng (Edge che do app), du lieu nam trong ho so rieng cua Rootcash.
rem Chay "Rootcash.cmd shortcut" de tao loi tat co icon tren Desktop.
setlocal
set "PAGE=%~dp0rootcash.html"
set "EDGE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not exist "%EDGE%" set "EDGE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if not exist "%EDGE%" (echo Khong tim thay Microsoft Edge. & pause & exit /b 1)
set "ARGS=--app=""%PAGE%"" --user-data-dir=""%LOCALAPPDATA%\Rootcash\window"" --no-first-run --no-default-browser-check --window-size=1440,920"
if /i "%~1"=="shortcut" (
  powershell -NoProfile -Command "$s=(New-Object -ComObject WScript.Shell).CreateShortcut([Environment]::GetFolderPath('Desktop')+'\Rootcash.lnk');$s.TargetPath=$env:EDGE;$s.Arguments=$env:ARGS.Replace([string][char]34+[char]34,[string][char]34);$s.IconLocation=$env:PAGE.Replace('rootcash.html','rootcash.ico');$s.WorkingDirectory=Split-Path $env:PAGE;$s.Save()"
  echo Da tao loi tat Rootcash tren Desktop.
  exit /b 0
)
start "" "%EDGE%" --app="%PAGE%" --user-data-dir="%LOCALAPPDATA%\Rootcash\window" --no-first-run --no-default-browser-check --window-size=1440,920
