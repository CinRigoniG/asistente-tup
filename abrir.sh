#!/usr/bin/env bash
# Abre el Asistente TUP en Linux o Mac. Si no está instalado, lo instala primero.
cd "$(dirname "$0")"

VPY=.venv/bin/python; [ -x "$VPY" ] || VPY=.venv/Scripts/python.exe   # Git Bash en Windows
if [ ! -x "$VPY" ]; then
  ./instalar.sh || exit 1
  VPY=.venv/bin/python; [ -x "$VPY" ] || VPY=.venv/Scripts/python.exe
fi

# Corre en segundo plano y sobrevive al cierre de la terminal. Si ya estaba abierto,
# el propio asistente sólo abre el navegador y sale.
mkdir -p "$HOME/.asistente-tup"
nohup "$VPY" -m backend.app "$@" >>"$HOME/.asistente-tup/asistente.log" 2>&1 &
echo "  Abriendo el Asistente TUP en el navegador (http://127.0.0.1:8790)…"
echo "  Para cerrarlo: botón «Cerrar asistente», arriba a la derecha."
