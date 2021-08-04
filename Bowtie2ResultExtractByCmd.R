library(getopt)
library(stringr)
args=matrix(
 c( "input", "i", 2, "character", "Keywords of samples in the order you want. Seperate keywords by ','.",
    "help", "h", 0, "logical", "Help:explanation of arguments."),
    byrow=TRUE,ncol=5 )

opt = getopt(args)

if(!is.null(opt$help) || is.null(opt$input)){
  cat(paste(getopt(args,usage=T), "\n"))
  quit()}

sample = opt$input
order = str_split(sample,pattern = ",",simplify = T)

d = c()
data = c()
for (i in order){
     f = Sys.glob(paste0(i,"*"))
     rep = Sys.glob(paste0(i,"*/results.xprs"))
     for (ii in f){
         d = paste(d,ii,sep = ";")}
     for (r in rep){
         data = paste(data,r,sep = ",") }
}
d = gsub("^;","",d)
data = gsub("^,","",data)
print(d)
print(data)
system(paste("python /bin/make_deseq.py ",data," Deseq_all.txt 5",sep=""),,wait=T)
system(paste("python /bin/make_deseq.py ",data," Counts_all.txt 8",sep=""),,wait=T)
system(paste("python /bin/make_deseq.py ",data," FPKM_all.txt 11",sep=""),wait=T)
print("Done.")
