setwd("/Users/jonathanbouchet/Desktop/WORK/R_PROGRAMMING/Coursera/assignment_week1")
corr<-function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        
        df <-data.frame()
        df<- complete(directory,1:332)
        
        correlations<-numeric(0)
        
        # make a vector if Id's for which complete cases > threshold
        NOBS<-df$nobs
        IDS<-df$id[NOBS > threshold]
        
        #print(IDS)
        #print(NOBS)
        alldata<-c(list.files(directory))
        j<-0
        for(i in IDS)
        {
        	#print(i)
        	j<-j+1
        	name<-paste(directory,alldata[i],sep="/")
        	#print(name)
        	currFile<-read.csv(name)
        	
        	#find NA rows and subset them in a new vector
        	good <- !is.na(currFile$sulfate) & !is.na(currFile$nitrate)
         	goodFile <- currFile[good, ]
         	
        	correlations<-c(correlations,cor(goodFile$sulfate,goodFile$nitrate))     
        }       
        head(correlations)
        correlations
}
