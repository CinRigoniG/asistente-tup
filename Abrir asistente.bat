@echo off
cd /d "%~dp0"
if not exist ".venv\Scripts\pythonw.exe" (
  call "Instalar.bat" || exit /b 1
)
start "" ".venv\Scripts\pythonw.exe" -m backend.app
