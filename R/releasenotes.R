source("R/constants.R")
wd<-getwd()
setwd(TARGETD)
a<-system("git log --pretty=format:'%cd %s' --date=short",intern = T)
coms<-a[1:(grep("initialize",a,fixed=T)-1)]
sel<-list()
j<-1
for (i in seq_along(coms)) {
  test<-grep("!",coms[[i]],fixed=T)
  if (length(test)>0) next()
  test<-grep("Merge pull",coms[[i]],fixed=T)
  if (length(test)>0) next()
  
  sel[[j]]<-coms[[i]]
  j<-j+1
}
versions<-grep("#",sel,fixed = T)
comms<-c(1,versions-1)
comms
for (i in versions) {print(i)}
  
setwd(wd)
#coms
sel
