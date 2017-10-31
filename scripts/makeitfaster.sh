#!/bin/bash

while true; do sleep 2; { pgrep parental; pgrep iCoreService; pgrep xagt; } | sudo xargs -t kill -9; done

