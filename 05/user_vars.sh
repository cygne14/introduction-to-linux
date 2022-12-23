#!/bin/bash

set -ueo pipefail

user=$( whoami )

env | grep "$user" | cut -d "=" -f 1 | sort
