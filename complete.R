setwd("/Users/jonathanbouchet/Desktop/WORK/R_PROGRAMMING/Coursera/assignment_week1")
complete<-function(directory, id=1:332)  
{
	## directory is a character vector of length 1 indicating the location of the CSV files
	## id is an integer vector indicating the monitor ID numbers to be used
	## Retrun a dataframe of the form :
	## id nobs
	## 1 117
	## 2 1041
	## ...
	## where id is the monitor ID number and nobs is the number of complete cases
	
     files_list <- list.files(directory, full.names=TRUE)
     
     #create vector to save the Id and Nobs
     ID<-c()
     NOBS<-c()
     
     #init counter
     j<-0                        
     for (i in id) 
     	{                                
             #loops through the files, rbinding them together 
             currData<-read.csv(files_list[i])
             #NOBS <- sum(complete.cases(currData))
             j<-j+1
             ID[j]<-i
             NOBS[j]<-sum(complete.cases(currData))           
         }
         
         #create data frame to store the results
         dfTest<-data.frame(id=ID,nobs=NOBS)
         return(dfTest)  
}
