#!/bin/bash
for i in *window*.csv
do
./ripser $i >${i}.out.txt
done
