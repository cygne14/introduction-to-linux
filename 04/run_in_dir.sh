#!/bin/bash

set -ueo pipefail

test -d 01 && cd 01 && test -f input.txt && cat input.txt | wc -w  || echo 0

exit 0
