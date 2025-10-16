#!/usr/bin/env sh
cmd="idea"; extra=""

if uname | grep -q "^MINGW"; then
  if command -v idea64.exe >/dev/null 2>&1; then
    cmd="idea64.exe"; extra=""
  elif command -v idea.bat >/dev/null 2>&1; then
    cmd="cmd.exe"; extra='/C idea.bat'
  else
    echo "Warning: not found idea64.exe/idea.bat on PATH; falling back to 'idea'" >&2
  fi
fi

"$cmd" $extra installPlugins \
  "Key Promoter X" \
  org.sonarlint.idea \
  "Lombok Plugin" \
  IdeaVIM \
  com.mallowigi \
  mobi.hsz.idea.gitignore \
  com.github.camork.fileExpander