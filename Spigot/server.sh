#!/bin/bash
while true; do
    java -server -Xmx2G -DenableDebugMethodProfiler=true -jar spigot.jar -nogui
done;
