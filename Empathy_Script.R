
############################# BIENVENUE #############################

############# I SOLEMNLY SWEAR THAT I AM UP TO NO GOOD ##############

#################################
## Loading packages

library(lavaan)

#################################
## Data reported by Wang et al. (2026)

n <- 359 ## sample size

rm <- matrix(c( ## correlations
  
   1.000,  0.233, -0.463,  0.341,
   0.233,  1.000, -0.303,  0.288, 
  -0.463, -0.303,  1.000, -0.311,
   0.341,  0.288, -0.311,  1.000), nrow=4)

colnames(rm) <- rownames(rm) <- c("ER","EM","PS","OC") ## names of variables

#################################
## Alternative model

altmod <- "

## Loadings

CSE =~ 1*EM+OC+ER+PS

## (Error) variances

EM ~~ EM
OC ~~ OC
ER ~~ ER
PS ~~ PS

CSE ~~ CSE

"

fit.alt <- lavaan(altmod, sample.cov=rm, ## fitting model to data 
            sample.nobs=n, meanstructure=F)

summary(fit.alt, fit.measures=T, ci=T, standardized=T, rsq=T) ## the results

####

alt2 <- paste(altmod,"\nOC~~PS")

fit2 <- lavaan(alt2, sample.cov=rm, ## fitting model to data 
                  sample.nobs=n, meanstructure=F)

summary(fit2, fit.measures=T, ci=T, standardized=T, rsq=T) ## the results

########################## MISCHIEF MANAGED #########################

############################# AU REVOIR #############################


