#!/bin/bash
for i in distances*window*out.txt
do
	perl getD1.pl $i
done
