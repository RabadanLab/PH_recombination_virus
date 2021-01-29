args<-commandArgs(TRUE);
						
dataset<- args[1];
window_size<-args[2];
steps<-args[3];

all_windows<-c()
tajima<-c()
theta<-c()
mean_pwd<-c()
max_pwd<-c()
number_of_sequences<-c()
window_length<-c()
message("------------Inputs--------------");
message("dataset: ", dataset);
message("window_size: ", window_size);
message("steps: ", steps);
message("-------------------------------");

						library('ape');

#						library(pegas);
alignment<-ape::read.dna(dataset, format="fasta");
window=window_size;
window=as.numeric(window);
step=steps;
step=as.numeric(step);

	nts<-length(alignment[1,]);
	length=1:nts;
all_windows<-c(all_windows,0)	
tajima<-c(tajima,pegas::tajima.test(alignment)$D)
theta<-c(theta,pegas::theta.s(alignment)/length(alignment[1,]))
mean_pwd<-c(mean_pwd,mean(ape::dist.dna(alignment,model="RAW",pairwise.deletion=TRUE,as.matrix=TRUE)))
max_pwd<-c(max_pwd,max(ape::dist.dna(alignment,model="RAW",pairwise.deletion=TRUE,as.matrix=TRUE)))
number_of_sequences<-c(number_of_sequences,length(alignment[,1]))
window_length<-c(window_length,length(alignment[1,]))
#write.table(cbind(tajima,theta,mean(pwd),max(pwd),median(pwd)),file="tajimaX.csv",sep=",")





			

	for (i in seq(along=length, by=step))
	{
				w=i+window-1
				if(w>length(alignment[1,])){break}
				filename<-paste(dataset,"window",w,"csv",sep=".");
				matriz<-ape::dist.dna(alignment[,i:w],model="N",pairwise.deletion=TRUE,as.matrix=TRUE)
				colnames(matriz)<-NULL
				rownames(matriz)<-NULL
				write.table(matriz,filename,row.names=FALSE,col.names=FALSE,sep=" ")
				tajima<-c(tajima,pegas::tajima.test(alignment[,i:w])$D)
				theta<-c(theta,pegas::theta.s(alignment[,i:w])/length(alignment[1,i:w]))
				all_windows<-c(all_windows,w)
				mean_pwd<-c(mean_pwd,mean(ape::dist.dna(alignment[,i:w],model="RAW",pairwise.deletion=TRUE,as.matrix=TRUE)))
				max_pwd<-c(max_pwd,max(ape::dist.dna(alignment[,i:w],model="RAW",pairwise.deletion=TRUE,as.matrix=TRUE)))
				#pwd<-ape::dist.dna(alignment[,i:w],model="RAW",pairwise.deletion=TRUE,as.matrix=TRUE)
				#write.dna(alignment[,i:w],filename,format="fasta")
				number_of_sequences<-c(number_of_sequences,length(alignment[,1]))
				window_length<-c(window_length,window_size)

				}
				
			write.table(cbind(all_windows,number_of_sequences,window_length,tajima,theta,mean_pwd,max_pwd),file="tajimaX.csv",sep="\t")				
		