@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0deploy-k8s.ps1"
