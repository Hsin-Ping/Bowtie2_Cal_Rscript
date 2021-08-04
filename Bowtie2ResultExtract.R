files=Sys.glob("*/result*")
files=as.data.frame(files)
print(files)
data=c()
for(i in files$files){
  data=paste(data,i,sep = ",")  
}
data=gsub("^,","",data)
print(data)

system(paste("python /bin/make_deseq.py ",data," Deseq_all.txt 5",sep=""),,wait=T)
system(paste("python /bin/make_deseq.py ",data," Counts_all.txt 8",sep=""),,wait=T)
system(paste("python /bin/make_deseq.py ",data," FPKM_all.txt 11",sep=""),wait=T)
#You still need to run Rscript /bin/Deseq_Normalize2.r in server124 to get DEseq2_all.txt!!!

