rm(list = ls())
suppressMessages(library("EpiModelHIV"))

#Laptop;
load("C:/Users/Johanna Chapin/Documents/EpiModelHIV/est/fit.m.rda")
load("C:/Users/Johanna Chapin/Documents/EpiModelHIV/est/fit.p.rda")
load("C:/Users/Johanna Chapin/Documents/EpiModelHIV/est/fit.i.rda")
load("C:/Users/Johanna Chapin/Documents/EpiModelHIV/est/st.rda")


est <- list(fit.m, fit.p, fit.i)

param <- param_msm(nwstats = st,
                   ai.scale.YY=1.437,
                   ai.scale.OY=1.279,
                   ai.scale.OO=0.829,
                   cond.rr.YY = 0.658,
                   cond.rr.OY = 0.723,
                   cond.rr.OO = 1.322,
                   prep.coverage = 0)

init <- init_msm(nwstats = st,
                 prev.Y = 0.2192,
                 prev.O = 0.3452)

control <- control_msm(simno = 1,
                       nsteps = 2609, #50 years;
                       nsims = 500,
                       ncores = 4,  #may need to change for hyak;
                       save.nwstats = TRUE,
                       verbose.int = 1)

sim <- netsim(est, param, init, control)





# at <- 1
# dat <- initialize_msm(est, param, init, control, s = 1)
#
# at<-at+1
#   dat <- aging_msm(dat, at)
#   dat <- deaths_msm(dat, at)
#   dat <- births_msm(dat, at)
#   dat <- test_msm(dat, at)
#   dat <- tx_msm(dat, at)
#   dat <- prep_msm(dat, at)
#   dat <- progress_msm(dat, at)
#   dat <- vl_msm(dat, at)
#   # dat <- update_aiclass_msm(dat, at)
#   # dat <- update_roleclass_msm(dat, at)
#   dat <- simnet_msm(dat, at)
#   dat <- disclose_msm(dat, at)
#   dat <- acts_msm(dat, at)
#   dat <- condoms_msm(dat, at)
#   dat <- riskhist_msm(dat, at)
#   dat <- position_msm(dat, at)
#   dat <- trans_msm(dat, at)
#   dat <- prevalence_msm(dat, at)



