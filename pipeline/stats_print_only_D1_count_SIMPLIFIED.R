####an alternative to ParseD1s_counts_INTERVALS_statistics_reads_empty2.R, which just show D1 count. By "Rscript *D1_count.R > outputfile.csv"
####we can get the table with D1 count per window and subset, which is useful if we are analyzing 100s of subsamples 


file <- system("ls Dimension1_*", intern=TRUE)
all_files=1:(length(file));
total_events<-c();
median_resta<-c();
min_resta<-c();
max_resta<-c();
mean_resta<-c();
sum_resta<-c();
sum_deaths<-c();

for (f in all_files)
	{
	windowx<-c();
		resta<-c();		
			zz<-c();
		windowx<-read.table(file[f], header=FALSE,sep=",");
		windowx = windowx[-1,];
			length=length(windowx[,1]);
			length_window=1:length;

			resta_interval<-c();
			deaths<-c();

		total_events<-c(total_events,length);

#		todo_junto<-cbind();

		}
file<-c(file,"0")
total_events<-c(total_events,sum(total_events))
todo_junto<-cbind(file,total_events);
todo_junto[,1]<-sub(".+window.","",todo_junto[,1],perl=TRUE)
todo_junto[,1]<-sub(".csv.+","",todo_junto[,1],perl=TRUE)
todo_junto<-cbind(as.numeric(todo_junto[,1]),total_events)
#todo_junto[,1]<-as.numeric(todo_junto[,1])
todo_junto<-todo_junto[order(todo_junto[,1]),]

colnames(todo_junto)<-c("window","B1_count")

		
print(total_events);
write.table(todo_junto, "todo_junto.csv", sep="\t")





