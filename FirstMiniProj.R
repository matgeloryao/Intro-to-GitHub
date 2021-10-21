# CMSC 197 - First Mini-Project

  # Mark Andrew Geloryao
  # BS in Statistics III


# For numbers 1 to 4, ensure that the working directory is the same to the directory
# where the csv files are located 

# So that when the codes run, there would not be any error found

  # For example, in numbers 1 to 3, the directory should be in the directory 
  # where the 332 csv files are located

  # For number 4, the directory should be with the 2 CSV files

# (1) Creating the function: pollutantmean
  pollutantmean <- function(directory, pollutant, ID){ #creating the function pollutantmean
    
    directory <- list.files(".") #listing the files found in the directory specified
    
    n <- c() # n is the partial sum of the number of observations per monitor
    sum <- c() # sum is the partial sum of the pollutant (either nitrate or sulfate) per monitor
    
    N <- 0 # N is the entire number of observations of all specified monitors 
    total <- 0 # total is the entire sum of the pollutant (either nitrate or sulfate) of all specified monitors
    mean <- 0 # mean results to the mean of that specific pollutant across the specified monitors
    
    for(i in 1:length(ID)){ # iteration would be done for every specified monitor
      
      b <- read.csv(directory[ID[i]]) # b results into a data frame containg the data of the specific monitor
      
      p <- b[pollutant] # p is a list containing the values of b with the specified pollutant
      na <- is.na(p) # na contains the list of the logical values of whether which has missing values 
      
      n[i] <- length(p[!na]) # n[i] contains the length of p without missing values of that specific monitor
      sum[i] <- sum(p[!na]) # sum[i] has the sum of the values of p without missing values
      
      N <- N + n[i] # adds the number of observations per monitor to the existing N
      total <- total + sum[i] # adds the sum of the specified monitor to the existing total
      
    }
    mean <- total/N # the mean is the quotient of the total and N
    
    return(mean) # returns the values of mean
    
    
    # Example:
        # pollutantmean("specdata", "nitrate", 23)
        ## [1] 1.28033
  }
  
  
# (2) Creating the function: complete
  complete <- function(directory, id){
    
    directory <- list.files(".") #listing the files found in the directory specified
    
    nobs <- c() # nobs is a vector containing the number of observations with complete values
    complete <- c() # complete will become our data frame containing id and nobs
    
    for(i in 1:length(id)){ # iteration would be done per monitor specified
      
      b <- read.csv(directory[id[i]]) # b isa data frame containing the data of the specific monitor
      d <- na.omit(b) # d is a data frame which the missing values are omitted
      nobs[i] <- nrow(d) # the number of complete observations is equal to the number of rows in d
    }
    
    complete <- data.frame(id,nobs) # complete is now a data frame containing the vectors id and nobs
    return(complete) # returns the data frame: complete
    
    #Example:
      # complete("specdata", 3)
      ##    id  nobs
      ##  1 3   243
  }
  
# (3) Creating the function: corr
  corr <- function(directory, threshold){
    
    directory <- list.files(".") #listing the files found in the directory specified
    
    clr <- c() # creating a vector for their respective correlation coefficients 
    
    for(i in 1:length(directory)){ # iteration done for all the monitors
      
      b <- read.csv(directory[i])
      d <- na.omit(b) # d is the data frame without any missing values
      
      if(nrow(d) > threshold){ # the number of complete observations is compared to the the threshold and
                               # it should be greater than the threshold in order to finds its correlation
        
        clr[i] = cor(d["nitrate"], d["sulfate"]) # clr[i] is the correlation coefficient of that monitor
      }                                          # specifically the correlation of the nitrate and sulfate
    } 
    p <- is.na(clr) # p contains the logical values whether clr has missing values
    return(clr[!p]) # returns a vector containing the correlation coefficients
    
    
    #Example:
      # cr <- corr("specdata", 150)
      # head(cr); summary(cr);
    
    ## -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
    
    ##        Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ##    -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 
  }
  
## Note: the change of directory would happen here
##       the directory would be set where the files needed are located 
  
# (4) Creating the histogram
  { 
    outcome <- read.csv('outcome-of-care-measures.csv', colClasses = "character") # outcome is a data frame
                                                                                  # containing the data of   
                                                                                  # outcome-of-measures.csv
  outcome[,11] <- as.numeric(outcome[,11]) # the values in outcome[,11] will be coerced in numeric values
  
  hist(outcome[,11], # the values in 11th column of outcome will be the data used in the histogram
       main ="Hospital 30-Day Death (Mortality) Rates from Heart Attack", # the histogram will have the title
       xlab ="Deaths", # the x-axis with be labeled as Deaths 
       col  = "light blue") # the color of the histogram is changed to light blue
  }
  