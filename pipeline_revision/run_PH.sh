for i in *.fas
do
mkdir outs.$i
Rscript get__distance*.R $i 100 100
sed -i '1s/^/	/' tajima*.csv
mv tajima*.csv outs.$i

bash runripser.sh
bash get_D1_bash.sh
Rscript stats*SIMPLIFIED.R
mv todo_junto.csv outs.$i
cp train* outs.$i
cp final_prediction*.R outs.$i
cd outs.$i
sed -i '1s/^/	/' todo_junto.csv
paste todo_junto.csv tajima*.csv > input_final.csv
Rscript final_prediction*.R
cd ..
rm $i*.csv
rm distances*.txt
rm distances*.csv
rm Dimension1*.txt
rm *out.txt
done
