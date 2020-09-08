library(dataPreparation)



tabla<-read.table("input_final.csv",header=TRUE,sep="\t")
train_set<-read.table("train_set_may16._with_val.csv",header=TRUE,sep=",")
tabla$B1_count_per_seq_bp<-tabla$B1_count/tabla$number_of_sequences/tabla$window_length


scales <- build_scales(dataSet = train_set, cols = c("theta", "tajima",'mean_pwd','B1_count_per_seq_bp'), verbose = TRUE)
X_train <- fastScale(dataSet = train_set, scales = scales, verbose = TRUE)

fit<-lm(expected_rate~tajima+theta+mean_pwd+B1_count_per_seq_bp,data=X_train)
X_test <- fastScale(dataSet = tabla, scales = scales, verbose = TRUE)

prediction<-predict(fit,X_test)
for (i in seq(along=1:length(prediction))){
if (prediction[i]=='NaN') {prediction[i]<-0}
 else if(prediction[i]<0){prediction[i]<-0}
 
 }
print(prediction)
write.table(cbind(tabla[,2],prediction),file="predictions.rec.csv",sep=",")



tabla<-read.table("input_final.csv",header=TRUE,sep="\t")
tabla$B1_count_per_seq_bp<-tabla$B1_count/tabla$number_of_sequences/tabla$window_length
tabla$B1_count_per_seq_bp.theta<-tabla$B1_count_per_seq_bp/tabla$theta
train_set.rm<-read.table("train_set_lim50.csv",header=TRUE,sep=",")
scales <- build_scales(dataSet = train_set.rm, cols = c("tajima",'mean_pwd','B1_count_per_seq_bp.theta'), verbose = TRUE)

X_trainRM <- fastScale(dataSet = train_set.rm, scales = scales, verbose = TRUE)
X_testRM <- fastScale(dataSet = tabla, scales = scales, verbose = TRUE)
fit.rm<-lm(expected_rate.expected_theta~tajima+mean_pwd+B1_count_per_seq_bp.theta,data=X_trainRM)


#prediction.rm<-predict(fit.rm,tabla)

prediction.rm<-predict(fit.rm,X_testRM)

for (i in seq(along=1:length(prediction.rm))){
if (prediction.rm[i]=='NaN') {prediction.rm[i]<-0}
 else if(prediction.rm[i]<0){prediction.rm[i]<-0}
 
 }
write.table(cbind(tabla[,2],prediction.rm),file="predictions.RM.csv",sep=",")




