#!/bin/bash
for i in distances*.csv
do
./ripser $i >${i}.out.txt
done
