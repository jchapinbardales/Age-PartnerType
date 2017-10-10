
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


## Install run scripts

system("scp inst/runsim.* hyak:/gscratch/csde/sjenness/hivtp/jcb/")


## Run sims

qsub -q batch -t 1-100 -m n -v SIMNO=1000 runsim.sh # run

qsub -q bf -t 101-200 -m n -v SIMNO=1000 runsim.sh
qsub -q bf -t 201-300 -m n -v SIMNO=1000 runsim.sh
qsub -q bf -t 301-400 -m n -v SIMNO=1000 runsim.sh
qsub -q bf -t 401-500 -m n -v SIMNO=1000 runsim.sh
qsub -q bf -t 501-625 -m n -v SIMNO=1000 runsim.sh


## Process datasets

process_simfiles(simno = 1000, outdir = "data/", compress = "xz")


## Download data

