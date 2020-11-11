#### PAckages that are needed ####
library(readr)
#library(EnvStats)
#### Dataset description:  ####
X <- data.frame(read_csv("data/sample.csv"))
rownames(X) <- X[,1]
X <- X[,-1]
X_ordered <- sort(X)
n=30
table(X)

## nice graphs
sequence =seq(0,5, by=1)

# densities
plot(x=sequence, y= dgeom(sequence, prob = 0.5), ylim = c(0,0.55), col='blue', main= "True density vs estimated density")
lines(x=sequence, dgeom(sequence, prob=0.5), col='blue')
points(table(X)/30)
# ECDF
geom <- pgeom(q = sequence , prob = 0.5)
plot(geom, col='blue', lty=2, main= 'Empirical CDF versus true CDF', ylab= 'y', xlab= 'X', ylim = c(0,1.001))
Fn <- 1:30/30
lines(X_ordered, Fn, type='s')
Fn<-ecdf(X_ordered)
lines(Fn)

# Key statistics 

p_hat_initial = 1/(mean(X)+1) #  Gives very bad insight since gives a proba >1




#### Set up for Confidence intervals ####
alpha=0.05
#### Assymptotically normal ####

#### Basic Bootstrap ####
B = 5000
M =1000
BB_vec_of_T <- rep(NA,M)
T_hat <- (1-(mean(X)+1)^(-1))^3
#T <- (1-(mu+1)^{-1} )^3
for (i in 1:B) {
  Xstar <- sample(X, replace = T) ; mu_star <- mean(Xstar)
  Tstar <- (1-(mu_star+1)^(-1))^3
  BB_vec_of_T[i] <- Tstar
  }
CIboot <- c( quantile(BB_vec_of_T, 1-0.05/2), quantile(BB_vec_of_T, 0.05/2)   )

#### PErcentile bootsrap ####