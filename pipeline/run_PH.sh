for i in sarbecovirus_with_sars_ref_clipped.fas
do
mkdir outs.$i
Rscript get__distance*.R $i 100 100
sed -i '1s/^/	/' tajima*.csv
mv tajima*.csv outs.$i
bash matrix_and*.sh
bash runripser.sh
bash get_D1_bash.sh
Rscript stats*SIMPLIFIED.R
mv todo_junto.csv outs.$i
cp train* outs.$i
cp final_prediction.R outs.$i
cd outs.$i
sed -i '1s/^/	/' todo_junto.csv
paste todo_junto.csv tajima*.csv > input_final.csv
Rscript final_prediction.R
cd ..
rm $i.window*.csv
rm distances_ripser*.txt
rm distances_ripser*.csv
rm Dimension1_distances*out.txt.txt
done
