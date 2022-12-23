#!/bin/bash

set -ueo pipefail

curl -s "$1" | grep -F 'href="mailto' | sed 's/=/\n/g' | sed 's/.*"mailto\:\([a-zA-Z0-9\.-]\+@\{1\}[a-zA-Z0-9\.-]\+\).*/\1/g' | grep "@" | sort

