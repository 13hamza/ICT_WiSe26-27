#!/bin/bash
#Get location From IP Adress
info=$(curl -s https://ipinfo.io/json)
city=$(echo "$info" | jq -r '.city')
lat=$(echo "$info" | jq -r '.loc' | cut -d, -f1)
lon=$(echo "$info" | jq -r '.loc' | cut -d, -f2)
#Get curretn tempeature From location
temp=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m" | jq -r '.current.temperature_2m')
echo "Location: $city ($lat, $lon)"
echo "current tempature: $temp "
