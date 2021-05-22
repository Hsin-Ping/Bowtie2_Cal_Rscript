library(getopt)
args=matrix(
 c( "input", "i", 2, "character", "Folder name of all transcriptomes.",
    "output", "o", 2, "character", "Create folder for saving bowtie2 results.",
    "help", "h", 0, "logical", "Help:explanation of arguments."),
    byrow=TRUE,ncol=5 )
#print(args)
opt=getopt(args)

if(!is.null(opt$help) || is.null(opt$input) || is.null(opt$output)){
  cat(paste(getopt(args,usage=T), "\n"))
  quit()}
Samples=opt$input
Bowtie2_Result=opt$output
print(Samples)
print(Bowtie2_Result)

#create a file to save Bowtie2 result
system(paste("mkdir ~/Desktop/", Bowtie2_Result,sep=""),wait=T)  

##build_index
cds=Sys.glob("*")
print(cds)
index_name="Bowtie2_index"
system(paste("bowtie2-build",cds,index_name,sep=" "),wait=T)
#print(paste("bowtie2-build",cds,index_name,sep=" "))

##grab_sample_file_name
samples=as.data.frame(Sys.glob(paste("~/Desktop/",Samples,"/*",sep="")))
colnames(samples)=c("name")

#Bowtie2_calculation
for (i in samples$name){
  R1=Sys.glob(paste(i,"/*R1*",sep = ""))
  R2=Sys.glob(paste(i,"/*R2*",sep = ""))
  id=basename(i)
  print(id)
  system(paste("bowtie2 -x ",index_name," -p 16"," -1 ",R1 ," -2 ",R2," | express ",cds," > express_",id,".log", sep = ""),wait = T)

  system(paste("mkdir ~/Desktop/", Bowtie2_Result,"/", id,sep = ""),wait = T)
  system(paste("mv express_", id , ".log results.xprs params.xprs", " ~/Desktop/", Bowtie2_Result,"/",id,sep = ""),wait = T)
}
