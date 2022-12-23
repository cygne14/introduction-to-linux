#!/bin/bash

set -ueo pipefail

cat README.md | tr -d 0-9 | head -n 15 | wc -L
