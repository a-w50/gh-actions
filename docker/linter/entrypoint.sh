#!/bin/sh -l

# clang-format --dry-run --style=file /github/workspace/src/test.cpp
clang-format --dry-run --style=file src/test.cpp | reviewdog -efm="%f:%l:%c: warning: %m" -reporter=github-check
#echo "Hello $1"
#time=$(date)
#echo "::set-output name=time::$time"

