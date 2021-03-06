#États choisis: Californie, Louisiana, Ohio, Minnesota, Montana
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#List all CSV Files in a Directory/Folder
ech_80_14_files = list.files("CSV/Echantillon 1", pattern="*.csv", full.names=TRUE)
ech_15_19_files = list.files("CSV/Echantillon 2", pattern="*.csv", full.names=TRUE)

#-------PREMIER ECHANTILLON: 1980 - 2014 -------#
#On crée le premier échantillon
data_tmp <- lapply(ech_80_14_files, function(i){
        read.csv(i, header=FALSE, skip=4)
})

# V17: moyenne; V18: max; V25: Nom de l'Etat;
df <- do.call(rbind.data.frame, data_tmp)
head(df)
#Sélection des colonnes pertinentes
data_80_14 <- data_80_14[,c("V25", "V18", "V17")]
#Sélection des données des Etats qui nous intéressent
data_80_14=subset(df, V25=="California" | V25=="Louisiana" | V25=="Ohio" | V25=="Minnesota" | V25=="Montana")
#Renommage des colonnes
colnames(data_80_14)[1] <- "État"
colnames(data_80_14)[2] <- "Température maximale"
colnames(data_80_14)[3] <- "Température moyenne"

#Comme la moyenne est une moyenne arithmétique, on peut déterminer
#la température minimale à partir de la moyenne et de la température
#maximale
#Moy = (Min+Max)/2
#2*Moy = Min+Max
#2*Moy-Max = Min
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
#écart-type = racine carré de la variance
sigma_max_1 <- sqrt(sigma_tmp/(nrow(data_80_14)-1))


#Moyenne de la température moyenne
moy_moyenne_1 <- mean(data_80_14$`Température moyenne`)

#Ecart type sur la température moyenne
sigma_tmp <- 0
for(j in 1:nrow(data_80_14))
{
        sigma_tmp <- sigma_tmp+(moy_moyenne_1-data_80_14$`Température moyenne`[j])^2
        
}
sigma_moy_1 <- sqrt(sigma_tmp/(nrow(data_80_14)-1))

#Moyenne de la température minimale
moy_min_1 <- mean(data_80_14$`temp_minimale`)

#Ecart type sur la température minimale
sigma_tmp <- 0
for(j in 1:nrow(data_80_14))
{
        sigma_tmp <- sigma_tmp+(moy_min_1-data_80_14$`temp_minimale`[j])^2
        
}
sigma_min_1 <- sqrt(sigma_tmp/(nrow(data_80_14)-1))

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
        sigma_tmp <- sigma_tmp + (data_15_19$`Température maximale`[j]-moy_max_2)^2
        
}
sigma_max_2 <- sqrt(sigma_tmp/(nrow(data_15_19)-1))
print(data_15_19$`Température maximale`)

#Moyenne de la température moyenne
moy_moyenne_2 <- mean(data_15_19$`Température moyenne`)

#Ecart type sur la température moyenne
sigma_tmp <- 0
for(j in 1:nrow(data_15_19))
{
        sigma_tmp <- eval.parent(substitute(sigma_tmp+(moy_moyenne_1-data_15_19$`Température moyenne`[j])^2))
        
}
sigma_moy_2 <- sqrt(sigma_tmp/(nrow(data_15_19)-1))

#Moyenne de la température minimale
moy_min_2 <- mean(data_15_19$`temp_minimale`)

#Ecart type sur la température minimale
sigma_tmp <- 0
for(j in 1:nrow(data_15_19))
{
        sigma_tmp <- sigma_tmp+(moy_min_1-data_15_19$`temp_minimale`[j])^2
        
}
sigma_min_2 <- sqrt(sigma_tmp/(nrow(data_15_19)-1))

#----------- COMPARAISON DES MOYENNES ----------------#
print("Moyennes pour l'échantillon 1: ")
print(paste0("Température minimale: ", moy_min_1))
print(paste0("Température moyenne: ", moy_moyenne_1))
print(paste0("Température maximale: ", moy_max_1))

print("Moyennes pour l'échantillon 2: ")
print(paste0("Température minimale: ", moy_min_2))
print(paste0("Température moyenne: ", moy_moyenne_2))
print(paste0("Température maximale: ", moy_max_2))

#---------------- COMPARAISON DES ECARTS TYPE ----------#
print("Ecarts type pour l'échantillon 1: ")
print(paste0("Température minimale: ", sigma_min_1))
print(paste0("Température moyenne: ", sigma_moy_1))
print(paste0("Température maximale: ", sigma_max_1))

print("Ecarts type pour l'échantillon 2: ")
print(paste0("Température minimale: ", sigma_min_2))
print(paste0("Température moyenne: ", sigma_moy_2))
print(paste0("Température maximale: ", sigma_max_2))

sigma_essai=sd(data_15_19$`Température maximale`)
print(paste0("ESSAI FONCTION SD ", sigma_essai))
      print(sigma_essai)


#---------- Partie avec les graphes -------------#
temp_maximale=data_80_14$`Température maximale`
temp_moy=data_80_14$`Température moyenne`

#Corrélation entre les 3 variables de température, pour l'échantillon 1
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

#Corrélation entre les 3 variables de température, pour l'échantillon 2
plot(data_15_19$temp_minimale,
     type="l",
     # 2.
     main="Corrélation entre les 3 variables statistiques",
     # 3.
     xlab="Nombre de mesures",
     ylab="Température (Farhenheit)",
     col="blue"
)
lines(data_15_19$`Température maximale`, type="l",col="red")
lines(data_15_19$`Température moyenne`, type="l",col="green")
legend("bottomleft", legend = c("Température minimale", "Température moyenne", "Température maximale"),
       col = c("blue", "green", "red"), lty = 1:2, cex = 0.8)

#Comparaison des moyennes entre les 2 échantillons
plot(moy_min_1,
     type="b",
     # 2.
     main="Comparaison des moyennes entre les 2 échantillons",
     # 3.
     ylab="Température (Farhenheit)",
     col="red",
     ylim = c(10, 70)
)

lines(moy_moyenne_1, type="b",col="red")
lines(moy_max_1, type="b",col="red")
lines(moy_min_2, type="b",col="blue")
lines(moy_moyenne_2, type="b",col="blue")
lines(moy_max_2, type="b",col="blue")
legend("bottomleft", legend = c("Moyennes sur échantillon 1", "Moyennes sur échantillon 2"),
       col = c("red", "blue"), lty = 1:2, cex = 0.8)

#Comparaison des écarts type entre les 2 échantillons
plot(sigma_min_1,
     type="b",
     # 2.
     main="Comparaison des écarts type entre les 2 échantillons",
     # 3.
     ylab="Température (Farhenheit)",
     col="red",
     ylim = c(10, 20)
)

lines(sigma_moy_1, type="b",col="red")
lines(sigma_max_1, type="b",col="red")
lines(sigma_min_2, type="b",col="blue")
lines(sigma_moy_2, type="b",col="blue")
lines(sigma_max_2, type="b",col="blue")
legend("bottomleft", legend = c("Moyennes sur échantillon 1", "Moyennes sur échantillon 2"),
       col = c("red", "blue"), lty = 1:2, cex = 0.8)