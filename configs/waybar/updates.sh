#!/usr/bin/env bash
# Cuenta actualizaciones pendientes (repos + AUR) y las saca en JSON para waybar.
# Requiere: pacman-contrib (checkupdates). AUR opcional: paru o yay.

set -uo pipefail

repo=$(checkupdates 2>/dev/null | wc -l)

aur=0
if command -v paru >/dev/null 2>&1; then
  aur=$(paru -Qua 2>/dev/null | wc -l)
elif command -v yay >/dev/null 2>&1; then
  aur=$(yay -Qua 2>/dev/null | wc -l)
fi

total=$((repo + aur))

if [ "$total" -eq 0 ]; then
  # sin actualizaciones: modulo vacio (waybar lo oculta)
  printf '{"text":"","tooltip":"sistema al día","class":"updated"}\n'
  exit 0
fi

printf '{"text":"󰚰 %s","tooltip":"%s en repos · %s en AUR","class":"pending"}\n' \
  "$total" "$repo" "$aur"
