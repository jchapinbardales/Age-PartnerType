
rm(list = ls())
library("methods")
suppressMessages(library("EpiModelHIV"))

simno <- as.numeric(Sys.getenv("SIMNO"))
jobno <- as.numeric(Sys.getenv("PBS_ARRAYID"))
fsimno <- paste(simno, jobno, sep = ".")

load("est/st.rda")

param <- param_msm(nwstats = st,
                   ai.scale.YY = 1.437,
                   ai.scale.OY = 1.279,
                   ai.scale.OO = 0.829,
                   cond.rr.YY = 0.658,
                   cond.rr.OY = 0.723,
                   cond.rr.OO = 1.322,
                   prep.coverage = 0)

init <- init_msm(nwstats = st,
                 prev.Y = 0.2192,
                 prev.O = 0.3452)

control <- control_msm(simno = fsimno,
                       nsteps = 2609, #50 years;
                       nsims = 16,
                       ncores = 16,  #may need to change for hyak;
                       save.nwstats = FALSE,
                       verbose = FALSE)

netsim_hpc("est/fit.rda", param, init, control,
           compress = TRUE, verbose = FALSE)