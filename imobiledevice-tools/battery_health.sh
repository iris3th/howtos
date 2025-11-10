#!/usr/bin/env bash

# Extract single numeric values safely
rawmaxcap=$(idevicediagnostics ioregentry AppleSmartBattery \
  | grep -i '<key>AppleRawMaxCapacity' -A1 \
  | grep -oP '(?<=<integer>)[0-9]+')

designcap=$(idevicediagnostics ioregentry AppleSmartBattery \
  | grep -i '<key>DesignCapacity' -A1 \
  | grep -oP '(?<=<integer>)[0-9]+')

# Trim whitespace and ensure only one line
rawmaxcap=$(echo "$rawmaxcap" | head -n1 | tr -d '[:space:]')
designcap=$(echo "$designcap" | head -n1 | tr -d '[:space:]')

echo "RawMaxCapacity ($rawmaxcap) / DesignCapacity ($designcap) * 100 = BatteryHealth%"

# Check for missing or invalid numbers
if [[ -z "$rawmaxcap" || -z "$designcap" ]]; then
    echo "⚠️  Error: Could not read capacity values."
    exit 1
fi

# Compute percentage safely
result=$(echo "scale=2; ($rawmaxcap / $designcap) * 100" | bc -l)

echo "Battery Health: ${result}%"

