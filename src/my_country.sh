#!/bin/bash
_country=Pakistan
_same_country=$_country

echo $_country

while read line
do
	echo $line
done < input.txt

echo "More text." >> input.txt

ls > files.txt

if [ "$country" = "Pakistan"]; then
	echo "Yes it is hardcoded"
else 
	echo "This wasnt hardcoded?"
fi

num = 32 
if [ $num -gt 0 ]; then
  echo "$num is positive"
elif [ $num -lt 0 ]; then
  echo "$num is negative"
else
  echo "$num is zero"
fi

fruit="apple"

case $fruit in
    "apple")
        echo "This is a red fruit."
        ;;
    "banana")
        echo "This is a yellow fruit."
        ;;
    "orange")
        echo "This is an orange fruit."
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac

