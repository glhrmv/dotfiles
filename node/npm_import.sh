#!/bin/bash

FILE=$1

if [[ -e $FILE ]]
then
  echo "[Ø] Globally installing packages from "$FILE".."

  xargs npm install --global < $FILE

  echo "[Ø] Done."

  exit 0
else
  echo "[Ø] No file given. (probably installed.txt)"

  exit 1
fi

