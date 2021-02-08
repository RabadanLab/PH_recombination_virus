
tabla<-read.table("input_final.csv",header=TRUE,sep="\t")
train_set<-read.table("train_set_rec.csv",header=TRUE,sep=",")
tabla$B1_count_per_seq_bp<-tabla$B1_count/tabla$number_of_sequences/tabla$window_length
train_set$RM<-train_set$B1_count_per_seq_bp/train_set$theta
tabla$RM<-tabla$B1_count_per_seq_bp/tabla$theta


fit<-lm(sqrt(expected.rate)~tajima+theta+mean_pwd+B1_count_per_seq_bp+RM,data=train_set)

prediction<-predict(fit,tabla,interval='confidence',level=0.95)


 
 

for (i in seq(along=1:length(prediction[,1]))){
if (prediction[i,1]=='NaN') {prediction[i,1]<-0}
 else if(prediction[i,1]<0){prediction[i,1]<-0}
 
 }
 
for (i in seq(along=1:length(prediction[,1]))){
if (prediction[i,2]=='NaN') {prediction[i,2]<-0}
 else if(prediction[i,2]<0){prediction[i,2]<-0}
 
 }
  
 for (i in seq(along=1:length(prediction[,1]))){
if (prediction[i,3]=='NaN') {prediction[i,3]<-0}
 else if(prediction[i,3]<0){prediction[i,3]<-0}
 
 }
 prediction<-prediction^2

 
print(prediction)
write.table(cbind(tabla[,2],prediction),file="predictions.rec_with_interval_95.csv",sep=",")


tabla<-read.table("input_final.csv",header=TRUE,sep="\t")
train_set<-read.table("train_set_for_rec_mut_ration.csv",header=TRUE,sep=",")
tabla$B1_count_per_seq_bp<-tabla$B1_count/tabla$number_of_sequences/tabla$window_length
train_set$RM<-train_set$B1_count_per_seq_bp/train_set$theta
tabla$B1_count_per_seq_bp.Theta<-tabla$B1_count_per_seq_bp/tabla$theta


fit<-lm(sqrt(expected_rate.expected_theta)~tajima+mean_pwd+B1_count_per_seq_bp.Theta,data=train_set)
prediction<-predict(fit,tabla,interval='confidence',level=0.95)



for (i in seq(along=1:length(prediction[,1]))){
if (prediction[i,1]=='NaN') {prediction[i,1]<-0}
 else if(prediction[i,1]<0){prediction[i,1]<-0}
 
 }
 
for (i in seq(along=1:length(prediction[,1]))){
if (prediction[i,2]=='NaN') {prediction[i,2]<-0}
 else if(prediction[i,2]<0){prediction[i,2]<-0}
 
 }
  
 for (i in seq(along=1:length(prediction[,1]))){
if (prediction[i,3]=='NaN') {prediction[i,3]<-0}
 else if(prediction[i,3]<0){prediction[i,3]<-0}
 
 }
 prediction<-prediction^2 
print(prediction)
write.table(cbind(tabla[,2],prediction),file="predictions.rm_with_interval_95.csv",sep=",")



 



