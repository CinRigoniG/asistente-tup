#!/usr/bin/env bash
# Instala el Asistente TUP en Linux o Mac. Se corre una sola vez.
set -e
cd "$(dirname "$0")"

echo
echo "  Instalando el Asistente TUP. Tarda un par de minutos la primera vez."
echo

if ! command -v claude >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/claude" ]; then
  echo "  [!] No encontré Claude Code. Instalalo desde https://claude.com/claude-code,"
  echo "      abrilo una vez para iniciar sesión y volvé a correr este instalador."
  exit 1
fi

PY=""
for c in python3 python; do
  if command -v "$c" >/dev/null 2>&1 && "$c" -c 'import sys; sys.exit(sys.version_info < (3, 10))'; then
    PY="$c"; break
  fi
done
if [ -z "$PY" ]; then
  echo "  [!] Hace falta Python 3.10 o más nuevo."
  echo "      Linux: sudo apt install python3 python3-venv   ·   Mac: https://www.python.org/downloads/"
  exit 1
fi

[ -d .venv ] || "$PY" -m venv .venv || {
  echo "  [!] No pude crear el entorno. En Debian/Ubuntu: sudo apt install python3-venv"
  exit 1
}
VPY=.venv/bin/python; [ -x "$VPY" ] || VPY=.venv/Scripts/python.exe   # Git Bash en Windows
"$VPY" -m pip install --disable-pip-version-check -q -r requirements.txt

echo
echo "  Listo. Para usarlo: ./abrir.sh  (en Mac, doble clic en «Abrir asistente.command»)."
echo
