for i in *.csv
do
cat $i | sed s'/.\+\"$//'| sed s'/^\n//'| sed  s'/.\+\" //'|tail -n +2 > distances_ripser.$i
done