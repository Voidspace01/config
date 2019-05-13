#!/usr/bin/env bash

rm -f ./cscope.*
touch cscope.files
find ./ -name "*.c" -o -name "*.pc" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" > cscope.files
cscope -b -q -i cscope.files
rm -f ./TAGS
find . -iname "*.c" -print -or -iname "*.h" -print -or -iname "*.pc" -print -or -iname "*.cpp" -print -or -iname "*.hpp" -print | xargs etags -o TAGS
