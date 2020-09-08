				#get Tajima's D and Watterson theta for every simulated alignment
				
				
			
args<-commandArgs(TRUE);
						
dataset<- args[1];

library(pegas)
library(ape)
alignment<-read.dna(dataset,format="fasta")


tajima<-tajima.test(alignment)$D
theta<-theta.s(alignment)/length(alignment[1,])
pwd<-dist.dna(alignment,model="RAW",pairwise.deletion=TRUE,as.matrix=TRUE)
print(cbind(tajima,theta,mean(pwd),max(pwd),median(pwd)))

