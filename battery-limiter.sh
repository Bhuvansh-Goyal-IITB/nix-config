#!/bin/env bash

if [[ "$(cat /sys/class/power_supply/BAT1/charge_control_end_threshold)" != "60" ]]; then
  echo 60 | sudo tee /sys/class/power_supply/BAT1/charge_control_end_threshold > /dev/null
fi
