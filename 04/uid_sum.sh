#!/bin/bash

set -ueo pipefail

cut -d : -f 3 | sort -nr | head -n 5 | paste -s -d + | bc
