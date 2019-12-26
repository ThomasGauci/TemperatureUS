#États choisis: Californie, Louisiana, Ohio, Minnesota, Montana

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
ech_80_14_files = list.files("CSV/Echantillon 1", pattern="*.csv", full.names=TRUE)
ech_15_19_files = list.files("CSV/Echantillon 2", pattern="*.csv", full.names=TRUE)

#-------PREMIER ECHANTILLON: 1980 - 2014 -------#
#On crée le premier échantillon
data_tmp <- lapply(ech_80_14_files,function(i){
        read.csv(i, header=FALSE, skip=4)
})

# V17: moyenne V18: max V25: Nom de l'Etat
df <- do.call(rbind.data.frame, data_tmp)
head(df)
data_80_14=subset(df, V25=="California" | V25=="Louisiana" | V25=="Ohio" | V25=="Minnesota" | V25=="Montana")
data_80_14 <- data_80_14[,c("V25", "V18", "V17")]
colnames(data_80_14)[1] <- "État"
colnames(data_80_14)[2] <- "Température maximale"
colnames(data_80_14)[3] <- "Température moyenne"

#Comme la moyenne est une moyenne arithmétique, on peut déterminer
#la température minimale à partir de la moyenne et de la température
#maximale
temp_minimale=2*data_80_14$`Température moyenne`-data_80_14$`Température maximale`
data_80_14$temp_minimale=temp_minimale

#Calcul de la moyenne et de l'écart type, pour cet échantillon

#Moyenne de la température max
moy_max_1 <- mean(data_80_14$`Température maximale`)
#Ecart type sur la température max
sigma_tmp <- 0
for(j in 1:nrow(data_80_14))
{
 sigma_tmp <- sigma_tmp + (moy_max_1-data_80_14$`Température maximale`[j])^2
        
}
sigma_max_1 <- sigma_tmp/(nrow(data_80_14)-1)


#Moyenne de la température moyenne
moy_moyenne_1 <- mean(data_80_14$`Température moyenne`)

#Ecart type sur la température moyenne
sigma_tmp <- 0
for(j in 1:nrow(data_80_14))
{
        sigma_tmp <- sigma_tmp+(moy_moyenne_1-data_80_14$`Température moyenne`[j])^2
        
}
sigma_moy_1 <- sigma_tmp/(nrow(data_80_14)-1)

#Moyenne de la température minimale
moy_min_1 <- mean(data_80_14$`temp_minimale`)

#Ecart type sur la température minimale
sigma_tmp <- 0
for(j in 1:nrow(data_80_14))
{
        sigma_tmp <- sigma_tmp+(moy_min_1-data_80_14$`temp_minimale`[j])^2
        
}
sigma_min_1 <- sigma_tmp/(nrow(data_80_14)-1)

#-------DEUXIEME ECHANTILLON: 2015 - 2019 -------#
#On fait pareil avec le deuxième échantillon

data_tmp <- lapply(ech_15_19_files,function(i){
        read.csv(i, header=FALSE, skip=4)
})

# V17 moyenne V18 max V25 Nom de l'Etat
df <- do.call(rbind.data.frame, data_tmp)
head(df)
data_15_19=subset(df, V25=="California" | V25=="Louisiana" | V25=="Ohio" | V25=="Minnesota" | V25=="Montana")
data_15_19 <- data_15_19[,c("V25", "V18", "V17")]
colnames(data_15_19)[1] <- "État"
colnames(data_15_19)[2] <- "Température maximale"
colnames(data_15_19)[3] <- "Température moyenne"

#Comme la moyenne est une moyenne arithmétique, on peut déterminer
#la température minimale à partir de la moyenne et de la température
#maximale
temp_minimale=2*data_15_19$`Température moyenne`-data_15_19$`Température maximale`
data_15_19$temp_minimale=temp_minimale

#Moyenne de la température max
moy_max_2 <- mean(data_15_19$`Température maximale`)
#Ecart type sur la température max
sigma_tmp <- 0
for(j in 1:nrow(data_15_19))
{
        sigma_tmp <- sigma_tmp + (moy_max_1-data_15_19$`Température maximale`[j])^2
        
}
sigma_max_2 <- sigma_tmp/(nrow(data_15_19)-1)


#Moyenne de la température moyenne
moy_moyenne_2 <- mean(data_15_19$`Température moyenne`)

#Ecart type sur la température moyenne
sigma_tmp <- 0
for(j in 1:nrow(data_15_19))
{
        sigma_tmp <- sigma_tmp+(moy_moyenne_1-data_15_19$`Température moyenne`[j])^2
        
}
sigma_moy_2 <- sigma_tmp/(nrow(data_15_19)-1)

#Moyenne de la température minimale
moy_min_2 <- mean(data_15_19$`temp_minimale`)

#Ecart type sur la température minimale
sigma_tmp <- 0
for(j in 1:nrow(data_15_19))
{
        sigma_tmp <- sigma_tmp+(moy_min_1-data_15_19$`temp_minimale`[j])^2
        
}
sigma_min_2 <- sigma_tmp/(nrow(data_15_19)-1)


#Partie avec les graphes (A TERMINER)
temp_maximale=data_80_14$`Température maximale`
temp_moy=data_80_14$`Température moyenne`

#Corrélation entre les 3 variables de température
plot(data_80_14$temp_minimale,
     type="l",
     # 2.
     main="Corrélation entre les 3 variables statistiques",
     # 3.
     xlab="Nombre de mesures",
     ylab="Température (Farhenheit)",
     col="blue"
)
lines(temp_maximale, type="l",col="red")
lines(temp_moy, type="l",col="green")
legend("bottomleft", legend = c("Température minimale", "Température moyenne", "Température maximale"),
       col = c("blue", "green", "red"), lty = 1:2, cex = 0.8)