#!/bin/bash

echo -n  "Random password: "
cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 20
