##### 
##### 
##### Intro to R for Biologists			2013-10-16
##### 
##### Simon A. Queenborough

##### exercises-03

# ACCESSING VARIABLES & MANAGING SUBSETS OF DATA

# best to import full dataset, and subset within R
# possibly the most difficult bit of R, but very useful


#Read the data
setwd("E:/R_Course/data/")
Squid <- read.table(file = "squidGSI.txt", header = TRUE)

#always check the data: What are the variable names?
names(Squid) # or head(Squid)


### str ###

# the status of each variable in the data frame

str(Squid)

#Wrong way:
Squid2 <- read.table(file = "squidGSI.txt", dec = ",", header = TRUE)

str(Squid2) # shows that GSI is a factor (=error!)


# after importing data and checking they are correct, plot the data!

# can use boxplots, dotplots, scatterplots (tomorrow!)..
# R doesnt recognise 'GSI':

GSI # error!

# so, there are different ways of accessing variables; good and bad.

# the argument 'data' in funcions

# linear regression 
M1 <- lm(GSI ~ factor(Location) + factor(Year), data = Squid)

# but, not all funcions have the argument 'data ='
mean(GSI, data = Squid) # error!

boxplot(GSI ~ factor(Location), data = Squid)

#### IF A FUNCTION HAS A DATA ARGUMENT, USE IT! ####



# THE $ SIGN


Squid$GSI
mean(Squid$GSI)


# INDICES

Squid[,6]
mean(Squid[,6])


######## ATTACH - the BAD way of accessing variables! #######


attach(Squid)
GSI
Location

mean(GSI)
boxplot(GSI)

# 'attach' sounds great!
# BUT, problems arise:
# if attach dataset with variable names that also outside data frame
# if variable names match R functions or example data sets

# solution:
# detach
# close and restart R

# BETTER NOT TO USE ATTACH()!


### ACCESSING SUBSETS OF DATA ###

# If we want to know what the codes are for sex..

Squid$Sex

unique(Squid$Sex)


# create vector of TRUE/FALSE (boolean)
Sel <- Squid$Sex == 1
Sel

# select rows of Squid that =TRUE
# [] for indices
# we want rows, therefore before the ','
SquidM <- Squid[Sel, ]

# all in one go...
SquidF <- Squid[Squid$Sex == 2, ]



unique(Squid$Location)
# many ways to extract the same data:
Squid123 <- Squid[Squid$Location == 1 | Squid$Location == 2 | Squid$Location == 3, ]
Squid123 <- Squid[Squid$Location != 4, ]
Squid123 <- Squid[Squid$Location < 4, ]
Squid123 <- Squid[Squid$Location <= 3, ]
Squid123 <- Squid[Squid$Location >= 1 & Squid$Location <= 3, ]

SquidF.OR.1 <- Squid[Squid$Sex == 1 & Squid$Location == 1,]


# incorrect!
SquidF <- Squid[Squid$Sex == 1, ]           # extracts female data, and assigns it to SquidF, which has fewer rows than Squid
SquidF1 <- SquidF[Squid$Location == 1, ]    # so, will add NAs to SquidF1
                   


### sorting the data

# order whole data frame
Ord1 <- order(Squid$Month)
Squid[Ord1, ]
Squid


# add more columns

Squid$fLocation <- factor(Squid$Location)
Squid$fSex <- factor(Squid$Sex,labels=c("M","F"))
Squid$fSex

names(Squid)
head(Squid)



#### COMBINING TWO DATASETS WITH A COMMON IDENTIFIER


Sq1 <- read.table(file = "squid1.txt", header = TRUE)
Sq2 <- read.table(file = "squid2.txt", header = TRUE)

head(Sq1)
head(Sq2)

SquidMerged <- merge(Sq1, Sq2, by = "Sample")
SquidMerged[1:14,]


# 'all' argument. FALSE = rows with NAs omitted; TRUE = NAs filled in
SquidMerged <- merge(Sq1, Sq2, by = "Sample", all= TRUE)
SquidMerged[1:14,]



### recoding categorical variables ###

Squid$fSex <- factor(Squid$Sex, labels = c("M", "F"))
Squid$fLocation <- factor(Squid$Location)
str(Squid)

Squid$fLocation <- factor(Squid$Location,
                    levels = c(2, 3, 1, 4))
Squid$fLocation


### exporting data ####



SquidM <- Squid[Squid$Sex == 1, ]
write.table(SquidM,
     file = "MaleSquid.txt",
     sep=" ", quote = FALSE, append = FALSE, na = "NA")
     
write.table(SquidM,
     file = "MaleSquid.txt",
     sep=",", quote = TRUE, append = FALSE, na = "NA")

write.table(SquidM,
     file = "MaleSquid.txt",
     sep=" ", quote = TRUE, append = TRUE, na = "NA")
     
