
## Install software

devtools::install_github("jchapinbardales/EpiModelHIV", ref = "AgePT")

system("scp est/*.rda hyak:/gscratch/csde/sjenness/hivtp/jcb/est")


## Pre-process estimation files

load("est/fit.m.rda")
load("est/fit.p.rda")
load("est/fit.i.rda")
est <- list(fit.m, fit.p, fit.i)
save(est, file = "est/fit.rda")

system("rm est/fit.m.rda")
system("rm est/fit.p.rda")
system("rm est/fit.i.rda")


## Install run scriptsd

system("scp inst/runsim.* hyak:/gscratch/csde/sjenness/hivtp/jcb/")

## Run sims

qsub -q batch -t 1 -m n -v SIMNO=1000,NJOBS=1 runsim.sh