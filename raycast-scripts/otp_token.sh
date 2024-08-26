#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Token
# @raycast.mode silent

# Optional parameters:
# @raycast.icon images/password.png
# @raycast.packageName Developer Utils
# @raycast.needsConfirmation false

# Documentation:
# @raycast.author Meng Yan
# @raycast.authorURL https://www.raycast.com/yanmxa

# 1. the otp command is from here: https://www.npmjs.com/package/awesome-otp
# 2. init the vpn secret: otp init
# 3. create/add the prefix to a file `echo "prefix" > ~/.otp_prefix`
# 4. get the token(prefix) into clipboard 

otp token --prefix "$(cat ~/.otp_prefix)" --no-info