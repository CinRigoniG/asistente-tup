#!/usr/bin/env bash
# Mac: doble clic en Finder abre esto en Terminal. Lanza el asistente y cierra la ventana.
"$(dirname "$0")/abrir.sh"
sleep 2
osascript -e 'tell application "Terminal" to close front window' >/dev/null 2>&1 &
exit 0
