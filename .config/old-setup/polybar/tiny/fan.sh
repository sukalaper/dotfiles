#!/bin/sh

getFanSpeed=$(sensors | grep -i "fan1" | head -1 | awk '{print $2}')
echo '' $getFanSpeed" RPM"
