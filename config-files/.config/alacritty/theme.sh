#!/bin/bash

for file in ./themes/*; do
  filename=$(basename "$file")
  
  sed -i "s|general\.import = \[\"./themes/.*\"\]|general.import = [\"./themes/$filename\"]|" ./alacritty.toml
  echo "$filename"

  read -r
done
