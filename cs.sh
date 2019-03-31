rm -f ./cscope.*
touch cscope.out
find ./ -name "*.c" -o -name "*.pc" -o -name "*.h" > cscope.files
cscope -b -q -i cscope.files
rm -f ./TAGS
find . -iname "*.c" -print -or -iname "*.h" -print -or -iname "*.pc" -print | etags -o TAGS -


