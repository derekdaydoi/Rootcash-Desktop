@echo off
rem Tao Rootcash.exe tu Rootcash.cs. Chi can Windows, khong cai them gi. Rootcash.exe phai nam canh rootcash.html.
cd /d "%~dp0"
"%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe" /nologo /codepage:65001 /optimize+ /target:winexe /out:Rootcash.exe /win32icon:rootcash.ico /r:System.Windows.Forms.dll Rootcash.cs
if errorlevel 1 (echo BUILD LOI & exit /b 1) else echo Da tao Rootcash.exe
