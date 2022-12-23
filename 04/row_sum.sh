#!/bin/bash

set -ueo pipefail

cut -d "|" -f 2 | tr -s ' ' | cut -b 2- | tr -s ' ' '+' | rev | cut -b 2- | rev | bc
