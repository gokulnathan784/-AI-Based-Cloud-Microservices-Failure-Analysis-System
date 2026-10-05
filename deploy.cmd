@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0deploy.ps1"
if errorlevel 1 (
  echo.
  echo ERROR: Docker deployment failed.
  exit /b 1
)
endlocal
