getwd()

var.table0<-c("trans.main","trans.casl","trans.inst","trans.recpt.sus","trans.inst.sus",
              "trans.stage.act","trans.stage.chr","trans.stage.aids","trans.undx",
              "trans.notinitiated","trans.notretained","trans.partsup","trans.fullsup")
sim<-merge_simfiles(simno=1000, indir="data/jcbdata", vars=var.table0)

vars <- which(names(sim$epi) %in% var.table0)
sim$epi <- sim$epi[vars]

#remove nan's from data
for (j in 1:length(sim$epi)) {
  for (i in 1:ncol(sim$epi[[j]])) {
    to.fix <- which(is.nan(sim$epi[[j]][,i]))
    if (length(to.fix) > 0) {
      sim$epi[[j]][,i][to.fix] <- 0
    }
  }
}

for (j in 1:length(sim$epi)) {
  for (i in 1:ncol(sim$epi[[j]])) {
    to.fix <- which(is.na(sim$epi[[j]][,i]))
    if (length(to.fix) > 0) {
      sim$epi[[j]][,i][to.fix] <- 0
    }
  }
}

#sim$epi #df for each variable with timesteps x sims

# df <- as.data.frame(sim) -- collapses over all sims, no variability
# sim$epi$trans.main[1:100]
# df$trans.main
#df not working to allow multiple simulations, just combines into means overall,
#which is not helpful if i need variability, so just stayed with sim$epi,
#may be referring to as.data.frame.netsim which is supposed to allow for multiple simulations(?);


### Table0 ###

#the sum of each of these groupings should add to 1 but are only
#adding to ~0.99=1, okay

sim <- truncate_sim(sim, at = 2505)

#pt
f.trans.main<-unname(colMeans(sim$epi$trans.main))
round(quantile(f.trans.main, probs=c(0.025,0.5,0.975)),3)
f.trans.casl<-unname(colMeans(sim$epi$trans.casl))
round(quantile(f.trans.casl, probs=c(0.025,0.5,0.975)),3)
f.trans.inst<-unname(colMeans(sim$epi$trans.inst))
round(quantile(f.trans.inst, probs=c(0.025,0.5,0.975)),3)

median(f.trans.main)
d1 <- do.call("c", sim$epi$trans.main)
median(d1); mean(d1)

#pt - tried tail
f.trans.main<-unname(colMeans(tail(sim$epi$trans.main,104)))
round(quantile(f.trans.main, probs=c(0.025,0.5,0.975)),3)
f.trans.casl<-unname(colMeans(tail(sim$epi$trans.casl,104)))
round(quantile(f.trans.casl, probs=c(0.025,0.5,0.975)),3)
f.trans.inst<-unname(colMeans(tail(sim$epi$trans.inst,104)))
round(quantile(f.trans.inst, probs=c(0.025,0.5,0.975)),3)

#role
f.trans.recpt.sus<-unname(colMeans(sim$epi$trans.recpt.sus))
round(quantile(f.trans.recpt.sus, probs=c(0.025,0.5,0.975)),3)
f.trans.inst.sus<-unname(colMeans(sim$epi$trans.inst.sus))
round(quantile(f.trans.inst.sus, probs=c(0.025,0.5,0.975)),3)

#role - tried tail
f.trans.recpt.sus<-unname(colMeans(tail(sim$epi$trans.recpt.sus,104)))
round(quantile(f.trans.recpt.sus, probs=c(0.025,0.5,0.975)),3)
f.trans.inst.sus<-unname(colMeans(tail(sim$epi$trans.inst.sus,104)))
round(quantile(f.trans.inst.sus, probs=c(0.025,0.5,0.975)),3)

#stage of infection
f.trans.stage.act<-unname(colMeans(tail(sim$epi$trans.stage.act,104)))
round(quantile(f.trans.stage.act, probs=c(0.025,0.5,0.975)),3)
f.trans.stage.chr<-unname(colMeans(tail(sim$epi$trans.stage.chr,104)))
round(quantile(f.trans.stage.chr, probs=c(0.025,0.5,0.975)),3)
f.trans.stage.aids<-unname(colMeans(tail(sim$epi$trans.stage.aids,104)))
round(quantile(f.trans.stage.aids, probs=c(0.025,0.5,0.975)),3)

#stage of care
f.trans.undx<-unname(colMeans(tail(sim$epi$trans.undx,104)))
round(quantile(f.trans.undx, probs=c(0.025,0.5,0.975)),3)
f.trans.notinitiated<-unname(colMeans(tail(sim$epi$trans.notinitiated,104)))
round(quantile(f.trans.notinitiated, probs=c(0.025,0.5,0.975)),3)
f.trans.notretained<-unname(colMeans(tail(sim$epi$trans.notretained,104)))
round(quantile(f.trans.notretained, probs=c(0.025,0.5,0.975)),3)
f.trans.partsup<-unname(colMeans(tail(sim$epi$trans.partsup,104)))
round(quantile(f.trans.partsup, probs=c(0.025,0.5,0.975)),3)
f.trans.fullsup<-unname(colMeans(tail(sim$epi$trans.fullsup,104)))
round(quantile(f.trans.fullsup, probs=c(0.025,0.5,0.975)),3)




var.table0.amongY<-c("trans.main.Y","trans.casl.Y","trans.inst.Y","trans.recpt.sus.amongY","trans.inst.sus.amongY",
              "trans.stage.act.amongY","trans.stage.chr.amongY","trans.stage.aids.amongY","trans.undx.amongY",
              "trans.notinitiated.amongY","trans.notretained.amongY","trans.partsup.amongY","trans.fullsup.amongY")
sim2<-merge_simfiles(simno=1000, indir="data/jcbdata", vars=var.table0.amongY)

sim2 <- truncate_sim(sim2, at = 2505)

#remove nan's from data
for (j in 1:length(sim2$epi)) {
  for (i in 1:ncol(sim2$epi[[j]])) {
    to.fix <- which(is.nan(sim2$epi[[j]][,i]))
    if (length(to.fix) > 0) {
      sim2$epi[[j]][,i][to.fix] <- 0
    }
  }
}

for (j in 1:length(sim2$epi)) {
  for (i in 1:ncol(sim2$epi[[j]])) {
    to.fix <- which(is.na(sim2$epi[[j]][,i]))
    if (length(to.fix) > 0) {
      sim2$epi[[j]][,i][to.fix] <- 0
    }
  }
}

sim2$epi$trans.casl.Y[1:100]
sim2$epi$trans.inst.Y[1:100]


### Table0 among transmissions to YMSM ###

#the sum of each of these groupings should add to 1 but are only
#adding to ~0.86

#pt
f.trans.main.Y<-unname(colMeans(sim2$epi$trans.main.Y))
round(quantile(f.trans.main.Y, probs=c(0.025,0.5,0.975)),3)
f.trans.casl.Y<-unname(colMeans(sim2$epi$trans.casl.Y))
round(quantile(f.trans.casl.Y, probs=c(0.025,0.5,0.975)),3)
f.trans.inst.Y<-unname(colMeans(sim2$epi$trans.inst.Y))
round(quantile(f.trans.inst.Y, probs=c(0.025,0.5,0.975)),3)

d1 <- do.call("c", sim2$epi$trans.main.Y)
d2 <- do.call("c", sim2$epi$trans.casl.Y)
d3 <- do.call("c", sim2$epi$trans.inst.Y)
median(d1); mean(d1)

mean(d1)
mean(d2)
mean(d3)
hist(d1)
hist(d2)
hist(d3)

f.trans.main.Y<-unname(colMeans(tail(sim2$epi$trans.main.Y,104)))
round(quantile(f.trans.main.Y, probs=c(0.025,0.5,0.975)),3)
f.trans.casl.Y<-unname(colMeans(tail(sim2$epi$trans.casl.Y,104)))
round(quantile(f.trans.casl.Y, probs=c(0.025,0.5,0.975)),3)
f.trans.inst.Y<-unname(colMeans(tail(sim2$epi$trans.inst.Y,104)))
round(quantile(f.trans.inst.Y, probs=c(0.025,0.5,0.975)),3)

#role
f.trans.recpt.sus.amongY<-unname(colMeans(tail(sim2$epi$trans.recpt.sus.amongY,104)))
round(quantile(f.trans.recpt.sus.amongY, probs=c(0.025,0.5,0.975)),3)
f.trans.inst.sus.amongY<-unname(colMeans(tail(sim2$epi$trans.inst.sus.amongY,104)))
round(quantile(f.trans.inst.sus.amongY, probs=c(0.025,0.5,0.975)),3)

#stage of infection
f.trans.stage.act.amongY<-unname(colMeans(tail(sim2$epi$trans.stage.act.amongY,104)))
round(quantile(f.trans.stage.act.amongY, probs=c(0.025,0.5,0.975)),3)
f.trans.stage.chr.amongY<-unname(colMeans(tail(sim2$epi$trans.stage.chr.amongY,104)))
round(quantile(f.trans.stage.chr.amongY, probs=c(0.025,0.5,0.975)),3)
f.trans.stage.aids.amongY<-unname(colMeans(tail(sim2$epi$trans.stage.aids.amongY,104)))
round(quantile(f.trans.stage.aids.amongY, probs=c(0.025,0.5,0.975)),3)

#stage of care
f.trans.undx.amongY<-unname(colMeans(tail(sim2$epi$trans.undx.amongY,104)))
round(quantile(f.trans.undx.amongY, probs=c(0.025,0.5,0.975)),3)
f.trans.notinitiated.amongY<-unname(colMeans(tail(sim2$epi$trans.notinitiated.amongY,104)))
round(quantile(f.trans.notinitiated.amongY, probs=c(0.025,0.5,0.975)),3)
f.trans.notretained.amongY<-unname(colMeans(tail(sim2$epi$trans.notretained.amongY,104)))
round(quantile(f.trans.notretained.amongY, probs=c(0.025,0.5,0.975)),3)
f.trans.partsup.amongY<-unname(colMeans(tail(sim2$epi$trans.partsup.amongY,104)))
round(quantile(f.trans.partsup.amongY, probs=c(0.025,0.5,0.975)),3)
f.trans.fullsup.amongY<-unname(colMeans(tail(sim2$epi$trans.fullsup.amongY,104)))
round(quantile(f.trans.fullsup.amongY, probs=c(0.025,0.5,0.975)),3)



