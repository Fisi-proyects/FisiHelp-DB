#!bin/bash
echo "Hello World"
count=0
for i in {1..2174}
do
    node index.js $i
    sleep 1
    echo "$i"
    count=$((count + 1))
done
echo "Count: $count"