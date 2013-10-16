##### 
##### 
##### Intro to R for Biologists			2013-10-16
##### 
##### Simon A. Queenborough

##### exercises-02

# IMPORTING DATA

# 1. Entering data by hand

# You can enter every number as an object:

a <- 59
b <- 55
c <- 53.5
d <- 55
e <- 52.5


a
b

# but the names of the objects (eg. 'a') are not very useful. Better to give them other names:

Wing1 <- 59
Wing2 <- 55
Wing3 <- 53.5
Wing4 <- 55
Wing5 <- 52.5

Wing1


# .. and you can then use these in calculations: 

sqrt( Wing1 )
2 * Wing1
Wing1 + Wing2
Wing1 + Wing2 + Wing3 + Wing4 + Wing5
(Wing1 + Wing2 + Wing3 + Wing4 + Wing5) / 5



# but R does not save the results of calculations unless they are named objects too

SQ.wing1 <- sqrt(Wing1)
Mul.W1 <- 2 * Wing1
Sum.12 <- Wing1 + Wing2
SUM12345 <- Wing1 + Wing2 + Wing3 + Wing4 + Wing5
Av <- (Wing1 + Wing2 + Wing3 + Wing4 + Wing5) / 5

SQ.wing1


# Object names should be useful
# and not include: £ $ % ^ & * ( ) { } [ ] @ ~ # ? ! < > 
# because most are operators


# 2. Entering data with 'c', concatenate

Wingcrd <- c(59, 55, 53.5, 55, 52.5, 57.5, 53, 55)

Wingcrd[1]
Wingcrd [1:5]
Wingcrd [-2]


# Functions included in R:

S.win <- sum(Wingcrd)
S.win

mean(Wingcrd)
max(Wingcrd)
min(Wingcrd)
median(Wingcrd)
var(Wingcrd)
sd(Wingcrd)



# Entering the other data:

Tarsus <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5)
Head <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8, 32.5, NA)
Wt <- c(9.5, 13.8, 14.8, 15.2, 15.5, 15.6, 15.6, 15.7)


# Use names for objects that are NOT names of functions!

head
Head


# The 'NA'

sum(Head)

?sum

sum(Head, na.rm = TRUE)



# 3. Combining variables: c, cbind, rbind

# in a vector:
BirdData <- c(Wingcrd, Tarsus, Head, Wt)

# the numbers [1], [14], [27] are numbers of indices
BirdData

# to identify the variables:
Id <- c(1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2,
     2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4)
Id

# simpler:
rep(c(1, 2, 3, 4), each = 8)

rep(1 : 4, each = 8)

a <- seq(from = 1, to = 4, by = 1)
a

a <- seq(from = 1, to = 4, by = 1)
rep(a, each = 8)

# it seems complex! but different analyses need different forms of data: in tables or vectores


# use names in place of numbers:

VarNames <- c("Wingcrd", "Tarsus", "Head", "Wt")
VarNames

Id2 <- rep(VarNames, each = 8)
Id2 # a 'string' of characters

# 'each = 8' is very important:

rep(VarNames, 8)



# Unite data by columns: cbind

Z <- cbind(Wingcrd, Tarsus, Head, Wt)
Z

Z[,1] # column 1
Z[1,] # row 1

Z[1:8, 1]

Z[1, 1]
Z[,2:3]

# can assign other variables:
X <- Z[4, 4]
Y <- Z[,4]
W <- Z[,-3]
D <- Z[, c(1, 3, 4)]
E <- Z[, c(-1, -3)]


# dimensions of Z
n <- dim(Z)
n
z.row <- dim(Z)[1]
z.row


Z2 <- rbind(Wingcrd, Tarsus, Head, Wt)
Z2



# the funcion 'vector'

# generate an empty vector
# useful to define how many elements in the vector e.g. in loops

W <- vector(length = 8)
w   # NB: case sensitive!
W

# fill the vector
W[1] <- 59
W[2] <- 55
W[3] <- 53.5
W[4] <- 55
W[5] <- 52.5
W[6] <- 57.5
W[7] <- 53
W[8] <- 55
W


W[1]
W[1 : 4]
W[2 : 6]
W[-2]
W[c (1, 3, 5)]
W[9] # there is no w[9]!


### matrix ###

# uniting data with 'matrix'

# instead of generating 4 vectors with length 8, we generate a matrix of dimensions 8 by 4:

Dmat <- matrix(nrow = 8, ncol = 4)
Dmat # an empty matrix

# fill the matrix by column
Dmat[, 1] <- c(59, 55, 53.5, 55, 52.5, 57.5, 53, 55)
Dmat[, 2] <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5,
                 20.6, 21.5)
Dmat[, 3] <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8,
                 32.5, NA)
Dmat[, 4] <- c(9.5, 13.8, 14.8, 15.2, 15.5, 15.6,
                 15.6, 15.7)

Dmat # matrix without names

# use 'colnames'
colnames(Dmat) <- c("Wingcrd", "Tarsus", "Head", "Wt")
Dmat

# also 'rownames'..

# can fill the matrix element by element:

Dmat[1, 1] <- 59.0
Dmat[1, 2] <- 22.3 # but takes a long time!





# if you have the data as objects, instead of generating an empty matrix, better to:
Dmat2 <- as.matrix(cbind(Wingcrd, Tarsus, Head, Wt))
Dmat2

# NB: in R there are many ways to do the same thing. Certain functions only accept matrices, not data.frames..

# other functions of matrices:

is.matrix(Dmat2)    # confirm it is a matrix
t(Dmat2)            # transpose
#Dmat %*% Dmat2      # matrix multiplication  
#solve(Dmat2)        # inverse






### data.frame ###

# combine variables of equal length
### can combine vectors of numbers, character strings, and factors (nominal or categorical) variables.

Dfrm <- data.frame(WC = Wingcrd, TS = Tarsus, HD = Head, W = Wt)
Dfrm

# can do calculations and include the result in the data frame:
Dfrm <- data.frame(WC = Wingcrd, TS = Tarsus, HD = Head, W=Wt, Wsq = sqrt(Wt))
Dfrm

# Wt != W
rm(Wt)
Wt

# but Dfrm$w still exists:
Dfrm$W


# The way of working with R is: 
# 1. import the data (described later), 
# 2. make changes, transformations etc. 
# 3. save the modified data.frame for further analysis


### list() ###


# till now, eaach row = unit of sampling
# a list = an object in which you can place unrelated variables, such as vectors, matrices, characters.
# in a list, each row does not = 1 unit of sampling

# vector
x1 <- c(1, 2, 3)

# factor
x2 <- c("a", "b", "c", "d")

# scalar (vector of size 1)
x3 <- 3

# matrix
x4 <- matrix(nrow = 2, ncol = 2)
x4[,1] <- c(1, 2)
x4[,2] <- c( 3, 4)

# list
Y <- list(x1 = x1, x2 = x2, x3 = x3, x4 = x4)

Y

# why do this?
## almost all results produced by functions are in the form of lists:

# linear regression
M <- lm(WC ~ W, data = Dfrm)
names(M)


# a list!:
M$coefficients


# we can join all the data that we have generated so far in a list:

AllData <- list(BirdData = BirdData, Id = Id, Z = Z,
                VarNames = VarNames)

# Well done for ging through all of that!
# In future, you should be able to *import* most of your data!

