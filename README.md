# Bowtie2_Cal_Rscript
## Instruction of Bowtie2BuildAndCal.R
A R script to build index and running bowtie2 of each your samples automatically.
### Praperation:
Create a index folder with your cds.fasta, which is going to execute Bowtie2.

Create a log file on the desktop to save the informations output in the terminal.
```bash
script bowtie2_210730.log
```
### Preview the Bowtie2BuildAndCal.R:
```R
Rscript Bowtie2BuildAndCal.R -h
```
![image](https://github.com/Hsin-Ping/Bowtie2_Cal_Rscript/blob/master/)

### Running Bowtie2BuildAndCal.R:
```R
Rscript Bowtie2BuildAndCal.R -i [folder of your samples(transcriptomes] -o [create a folder to save results of each samples.]
```
### Finish the record of log file:
```bash
exit
```

## Instruction of Bowtie2ResultExtract.R 
cd to the folder which save all bowtie2 result, and run the Bowtie2ResultExtract.R. The script will extracts fpkm, deseq, counts by default order.
## Instruction of Bowtie2ResultExtractByCmd.R
cd to the folder which save all bowtie2 result, and giving the key words of samples by the order you want.

![image](https://github.com/Hsin-Ping/Bowtie2_Cal_Rscript/blob/master/Bowtie2ResultExtract_help.png)
