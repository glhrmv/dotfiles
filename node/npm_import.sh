#!/bin/bash

FILE=$1

if [ -f "${FILE}" ]; then
  echo "[Ø] Globally installing packages from "$FILE".."
  xargs npm install --global < $FILE
  echo "[Ø] Done."
  exit 0
else
  echo "[Ø] You need to give me a file!"
  exit 1
fi

