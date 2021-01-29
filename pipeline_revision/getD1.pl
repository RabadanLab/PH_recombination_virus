$A = $ARGV[0];

chomp $A;

open(file, $A);


$output = "Dimension1_$A.txt";

open(Dimension1_, ">$output");

$/="persistence intervals in dim 1";
print Dimension1_ "0,0";
while (<file>){
next if $_=~("persistence intervals in dim 0");
$_ =~ s/persistence intervals in dim 1://g;
$/=":";
$_ =~ s/ \n//g;
#$_ =~ s/\n//g;
$_ =~ s/://g;
$_ =~ s/\[//g;
$_ =~ s/\)//g;
$_ =~ s/ \{/,/g;
$_ =~ s/\{//g;
$_ =~ s/\}//g;
$_ =~ s/,,/,/g;
$_ =~ s/ ,/,/g;
print Dimension1_ $_;
}
close Dimension1_;
exit;