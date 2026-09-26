@echo off
chcp 65001 >nul
title Asistente TUP - Instalacion
cd /d "%~dp0"
echo.
echo  Instalando el Asistente TUP. Tarda un par de minutos la primera vez.
echo.
where claude >nul 2>nul
if errorlevel 1 if not exist "%USERPROFILE%\.local\bin\claude.exe" (
  echo  [!] No encontre Claude Code. Instalalo desde https://claude.com/claude-code
  echo      abrilo una vez para iniciar sesion y despues volve a correr este instalador.
  echo.
  pause
  exit /b 1
)
set PY=
where py >nul 2>nul && set PY=py -3
if not defined PY where python >nul 2>nul && set PY=python
if not defined PY (
  echo  [!] No encontre Python. Instalalo desde https://www.python.org/downloads/
  echo      y marca la opcion "Add python.exe to PATH".
  pause
  exit /b 1
)
if not exist ".venv\Scripts\python.exe" %PY% -m venv .venv || goto :fallo
".venv\Scripts\python.exe" -m pip install --disable-pip-version-check -q -r requirements.txt || goto :fallo
echo.
echo  Listo. Para usarlo, hace doble clic en "Abrir asistente".
echo.
pause
exit /b 0
:fallo
echo.
echo  [!] Algo fallo durante la instalacion. Copia este mensaje y pasaselo a quien te ayuda.
pause
exit /b 1
