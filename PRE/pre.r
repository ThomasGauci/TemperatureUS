#?tats choisis: Californie, Louisiana, Ohio, Minnesota, Montana
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#List all CSV Files in a Directory/Folder
ech_80_14_files = list.files("CSV/Echantillon 1", pattern="*.csv", full.names=TRUE)
ech_15_19_files = list.files("CSV/Echantillon 2", pattern="*.csv", full.names=TRUE)

#-------PREMIER ECHANTILLON: 1980 - 2014 -------#
#On cr?e le premier ?chantillon
data_tmp <- lapply(ech_80_14_files, function(i){
  read.csv(i, header=FALSE, skip=4)
})
df <- do.call(rbind.data.frame, data_tmp)

#-------DEUXIEME ECHANTILLON: 2015 - 2019 -------#
#On fait pareil avec le deuxi?me ?chantillon

data_tmp <- lapply(ech_15_19_files,function(i){
  read.csv(i, header=FALSE, skip=4)
})
df <- do.call(rbind.data.frame, data_tmp)