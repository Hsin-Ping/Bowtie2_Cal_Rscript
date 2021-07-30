# Instruction of Bowtie2BuildAndCal.R
## Praperation:
Step 1 : Create a index folder with your cds.fasta, which is going to execute Bowtie2.

Step 2 : Create a log file on the desktop to save the informations output in the terminal.
```bash
script bowtie2_210730.log
```
## Preview the Bowtie2BuildAndCal.R:
```R
Rscript Bowtie2BuildAndCal.R -h
```
![image](https://github.com/Hsin-Ping/Bowtie2_Cal_Rscript/blob/master/截圖%202021-07-30%20下午4.47.24.png)

## Running Bowtie2BuildAndCal.R:
```R
Rscript Bowtie2BuildAndCal.R -i [folder of your samples(transcriptomes] -o [create a folder to save results of each samples.]
```
## Finish the record of log file:
```bash
exit
```
