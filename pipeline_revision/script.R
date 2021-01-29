args<-commandArgs(TRUE)
dataset<- args[1]
library('ape')
alignment<-read.dna(dataset, format="fasta")


number_of_sequences<-1:length(alignment[,1])

#random_sample<-sample(number_of_sequences,100,replace=FALSE)

#final_subset<-alignment[random_sample,]


#filename<-paste(dataset,".fas",sep='fas')

#write.dna(final_subset,filename,format='fasta')


for (i in seq(along=1:1)){

random_sample<-sample(number_of_sequences,100,replace=FALSE)

final_subset<-alignment[random_sample,]


filename<-paste(dataset,100,i,"fas",sep='.')

write.dna(final_subset,filename,format='fasta')

}