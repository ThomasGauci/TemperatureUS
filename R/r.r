# V17: moyenne; V18: max; V25: Nom de l'Etat;
head(df)
#S?lection des colonnes pertinentes
data_80_14 <- data_80_14[,c("V25", "V18", "V17")]
#S?lection des donn?es des Etats qui nous int?ressent
data_80_14=subset(df, V25=="California" | V25=="Louisiana" | V25=="Ohio" | V25=="Minnesota" | V25=="Montana")
#Renommage des colonnes
colnames(data_80_14)[1] <- "?tat"
colnames(data_80_14)[2] <- "Temp?rature maximale"
colnames(data_80_14)[3] <- "Temp?rature moyenne"

#Comme la moyenne est une moyenne arithm?tique, on peut d?terminer
#la temp?rature minimale ? partir de la moyenne et de la temp?rature
#maximale
#Moy = (Min+Max)/2
#2*Moy = Min+Max
#2*Moy-Max = Min
temp_minimale=2*data_80_14$`Temp?rature moyenne`-data_80_14$`Temp?rature maximale`
data_80_14$temp_minimale=temp_minimale

#Calcul de la moyenne et de l'?cart type, pour cet ?chantillon

#Moyenne de la temp?rature max
moy_max_1 <- mean(data_80_14$`Temp?rature maximale`)
#Ecart type sur la temp?rature max
sigma_tmp <- 0
for(j in 1:nrow(data_80_14))
{
  sigma_tmp <- sigma_tmp + (moy_max_1-data_80_14$`Temp?rature maximale`[j])^2
  
}
#?cart-type = racine carr? de la variance
sigma_max_1 <- sqrt(sigma_tmp/(nrow(data_80_14)-1))


#Moyenne de la temp?rature moyenne
moy_moyenne_1 <- mean(data_80_14$`Temp?rature moyenne`)

#Ecart type sur la temp?rature moyenne
sigma_tmp <- 0
for(j in 1:nrow(data_80_14))
{
  sigma_tmp <- sigma_tmp+(moy_moyenne_1-data_80_14$`Temp?rature moyenne`[j])^2
  
}
sigma_moy_1 <- sqrt(sigma_tmp/(nrow(data_80_14)-1))

#Moyenne de la temp?rature minimale
moy_min_1 <- mean(data_80_14$`temp_minimale`)

#Ecart type sur la temp?rature minimale
sigma_tmp <- 0
for(j in 1:nrow(data_80_14))
{
  sigma_tmp <- sigma_tmp+(moy_min_1-data_80_14$`temp_minimale`[j])^2
  
}
sigma_min_1 <- sqrt(sigma_tmp/(nrow(data_80_14)-1))

#-------DEUXIEME ECHANTILLON: 2015 - 2019 -------#
#On fait pareil avec le deuxi?me ?chantillon


# V17 moyenne V18 max V25 Nom de l'Etat
head(df)
data_15_19=subset(df, V25=="California" | V25=="Louisiana" | V25=="Ohio" | V25=="Minnesota" | V25=="Montana")
data_15_19 <- data_15_19[,c("V25", "V18", "V17")]
colnames(data_15_19)[1] <- "?tat"
colnames(data_15_19)[2] <- "Temp?rature maximale"
colnames(data_15_19)[3] <- "Temp?rature moyenne"

#Comme la moyenne est une moyenne arithm?tique, on peut d?terminer
#la temp?rature minimale ? partir de la moyenne et de la temp?rature
#maximale
temp_minimale=2*data_15_19$`Temp?rature moyenne`-data_15_19$`Temp?rature maximale`
data_15_19$temp_minimale=temp_minimale

#Moyenne de la temp?rature max
moy_max_2 <- mean(data_15_19$`Temp?rature maximale`)
#Ecart type sur la temp?rature max
sigma_tmp <- 0
for(j in 1:nrow(data_15_19))
{
  sigma_tmp <- sigma_tmp + (data_15_19$`Temp?rature maximale`[j]-moy_max_2)^2
  
}
sigma_max_2 <- sqrt(sigma_tmp/(nrow(data_15_19)-1))
print(data_15_19$`Temp?rature maximale`)

#Moyenne de la temp?rature moyenne
moy_moyenne_2 <- mean(data_15_19$`Temp?rature moyenne`)

#Ecart type sur la temp?rature moyenne
sigma_tmp <- 0
for(j in 1:nrow(data_15_19))
{
  sigma_tmp <- eval.parent(substitute(sigma_tmp+(moy_moyenne_1-data_15_19$`Temp?rature moyenne`[j])^2))
  
}
sigma_moy_2 <- sqrt(sigma_tmp/(nrow(data_15_19)-1))

#Moyenne de la temp?rature minimale
moy_min_2 <- mean(data_15_19$`temp_minimale`)

#Ecart type sur la temp?rature minimale
sigma_tmp <- 0
for(j in 1:nrow(data_15_19))
{
  sigma_tmp <- sigma_tmp+(moy_min_1-data_15_19$`temp_minimale`[j])^2
  
}
sigma_min_2 <- sqrt(sigma_tmp/(nrow(data_15_19)-1))

#----------- COMPARAISON DES MOYENNES ----------------#
print("Moyennes pour l'?chantillon 1: ")
print(paste0("Temp?rature minimale: ", moy_min_1))
print(paste0("Temp?rature moyenne: ", moy_moyenne_1))
print(paste0("Temp?rature maximale: ", moy_max_1))

print("Moyennes pour l'?chantillon 2: ")
print(paste0("Temp?rature minimale: ", moy_min_2))
print(paste0("Temp?rature moyenne: ", moy_moyenne_2))
print(paste0("Temp?rature maximale: ", moy_max_2))

#---------------- COMPARAISON DES ECARTS TYPE ----------#
print("Ecarts type pour l'?chantillon 1: ")
print(paste0("Temp?rature minimale: ", sigma_min_1))
print(paste0("Temp?rature moyenne: ", sigma_moy_1))
print(paste0("Temp?rature maximale: ", sigma_max_1))

print("Ecarts type pour l'?chantillon 2: ")
print(paste0("Temp?rature minimale: ", sigma_min_2))
print(paste0("Temp?rature moyenne: ", sigma_moy_2))
print(paste0("Temp?rature maximale: ", sigma_max_2))

sigma_essai=sd(data_15_19$`Temp?rature maximale`)
print(paste0("ESSAI FONCTION SD ", sigma_essai))
print(sigma_essai)

  