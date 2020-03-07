#!/bin/sh -l

echo "Hello there, Mr. $1"
time=$(date)
echo ::set-output name=time::$time
exit 1
