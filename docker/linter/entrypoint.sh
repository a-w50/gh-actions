#!/bin/sh -l

clang-format --dry-run --style=file /github/workspace/src/test.cpp

#echo "Hello $1"
#time=$(date)
#echo "::set-output name=time::$time"

