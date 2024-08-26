#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Connect Viscosity
# @raycast.mode silent

# Optional parameters:
# @raycast.icon images/viscosity.png
# @raycast.argument1 { "type": "dropdown", "placeholder": "GLOBAL/PEK2", "data": [{"title": "GLOBAL", "value": "Red Hat Global VPN (TCP Alternate)"}, {"title": "PEK2", "value": "Beijing (PEK2 Alternate)"}] }
# @raycast.packageName Developer Utils
# @raycast.needsConfirmation false

# Documentation:
# @raycast.author Meng Yan
# @raycast.authorURL https://www.raycast.com/yanmxa

# 1. the otp command is from here: https://www.npmjs.com/package/awesome-otp
# 2. init the vpn secret: otp init
# 3. create/add the prefix to a file `echo "prefix" > ~/.otp_prefix`

name="$1"
if [ -z "$name" ]; then
    name="Red Hat Global VPN (TCP Alternate)"
fi

otp token --prefix "$(cat ~/.otp_prefix)" --no-info && otp viscosity -o "$name"