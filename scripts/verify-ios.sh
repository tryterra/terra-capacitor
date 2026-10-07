#!/bin/sh
set -e

xcodebuild -scheme TerraCapacitor -destination generic/platform=iOS -quiet

SIMULATOR_ID=$(xcrun simctl list devices available -j | node -e '
  const { devices } = JSON.parse(require("fs").readFileSync(0, "utf8"));
  const iphone = Object.entries(devices)
    .filter(([runtime]) => runtime.includes("iOS"))
    .flatMap(([, list]) => list)
    .find((device) => device.deviceTypeIdentifier.includes("iPhone"));
  if (!iphone) throw new Error("No available iPhone simulator");
  console.log(iphone.udid);
')
xcodebuild test -scheme TerraCapacitor -destination "id=$SIMULATOR_ID" -quiet

pod lib lint TerraCapacitor.podspec --allow-warnings
