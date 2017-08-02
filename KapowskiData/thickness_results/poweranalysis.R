# Power analysis for cortical thickness pipelines ANTs vs FreeSurfer

library(pwr)

a.resultsIXI <- read.csv('ANTSlabelresultsI.csv')
a.resultsKirby <- read.csv('ANTSlabelresultsK.csv')
a.resultsNKI <- read.csv('ANTSlabelresultsN.csv')
a.resultsOasis <- read.csv('ANTSlabelresultsO.csv')
a.resultsCombined <- rbind(a.resultsIXI, a.resultsKirby, a.resultsNKI, a.resultsOasis )

f.resultsIXI <- read.csv('FSlabelresultsI.csv')
f.resultsKirby <- read.csv('FSlabelresultsK.csv')
f.resultsNKI <- read.csv('FSlabelresultsN.csv')
f.resultsOasis <- read.csv('FSlabelresultsO.csv')
f.resultsCombined <- rbind(f.resultsIXI, f.resultsKirby, f.resultsNKI, f.resultsOasis)

a.nsubjects <- nrow(a.resultsCombined)
f.nsubjects <- nrow(f.resultsCombined)

# get average cortical thickness for all labeled regions
regions <- colnames(a.resultsCombined[6:67])
a.avg <- a.sd <- vector()
f.avg <- f.sd <- vector()
for (i in 6:67){
  a.avg[i] <- mean(a.resultsCombined[,i])
  a.sd[i] <- sd(a.resultsCombined[,i])
  f.avg[i] <- mean(f.resultsCombined[,i])
  f.sd[i] <- sd(f.resultsCombined[,i])
#  sd.pooled[i] <- sqrt(((a.sd[i])^2 + (f.sd[i])^2)/2)
}
a.avg <- as.data.frame(na.omit(a.avg))
a.sd <- as.data.frame(na.omit(a.sd))
f.avg <- as.data.frame(na.omit(f.avg))
f.sd <- as.data.frame(na.omit(f.sd))
diff.mean <- a.avg - f.avg
sd.pooled <- sqrt(((a.sd)^2 + (f.sd)^2)/2)
cohens.d <- diff.mean/sd.pooled
af.average <- cbind(a.avg, a.sd, f.avg, f.sd, diff.mean, sd.pooled, cohens.d)
rownames(af.average) <- regions
colnames(af.average) <- c("ANTs mean", "ANTs sd", "Freesurfer mean", 
                          "Freesurfer sd", "ANTs - FS mean", "ANTs - FS sd", "Cohen's d")

l.entorhinal <- af.average["left.entorhinal",]
l.superiorfrontal <- af.average["left.superior.frontal",]
r.entorhinal <- af.average["right.entorhinal",]
r.superiorfrontal <- af.average["right.superior.frontal",]

l.entorhinal.pwr <- pwr.t.test(d=l.entorhinal[1,7], sig.level=0.05, power=0.90, type="paired", alternative="greater")
l.superiorfrontal.pwr <- pwr.t.test(d=l.superiorfrontal[1,7], sig.level=0.05, power=0.90, type="paired", alternative="greater")
r.entorhinal.pwr <- pwr.t.test(d=r.entorhinal[1,7], sig.level=0.05, power=0.90, type="paired", alternative="greater")
r.superiorfrontal.pwr <- pwr.t.test(d=r.superiorfrontal[1,7], sig.level=0.05, power=0.90, type="paired", alternative="greater")


