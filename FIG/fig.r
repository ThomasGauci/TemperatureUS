#---------- Partie avec les graphes -------------#
temp_maximale=data_80_14$`Temp?rature maximale`
temp_moy=data_80_14$`Temp?rature moyenne`

#Corr?lation entre les 3 variables de temp?rature, pour l'?chantillon 1
plot(data_80_14$temp_minimale,
     type="l",
     # 2.
     main="Corr?lation entre les 3 variables statistiques",
     # 3.
     xlab="Nombre de mesures",
     ylab="Temp?rature (Farhenheit)",
     col="blue"
)
lines(temp_maximale, type="l",col="red")
lines(temp_moy, type="l",col="green")
legend("bottomleft", legend = c("Temp?rature minimale", "Temp?rature moyenne", "Temp?rature maximale"),
       col = c("blue", "green", "red"), lty = 1:2, cex = 0.8)

#Corr?lation entre les 3 variables de temp?rature, pour l'?chantillon 2
plot(data_15_19$temp_minimale,
     type="l",
     # 2.
     main="Corr?lation entre les 3 variables statistiques",
     # 3.
     xlab="Nombre de mesures",
     ylab="Temp?rature (Farhenheit)",
     col="blue"
)
lines(data_15_19$`Temp?rature maximale`, type="l",col="red")
lines(data_15_19$`Temp?rature moyenne`, type="l",col="green")
legend("bottomleft", legend = c("Temp?rature minimale", "Temp?rature moyenne", "Temp?rature maximale"),
       col = c("blue", "green", "red"), lty = 1:2, cex = 0.8)

#Comparaison des moyennes entre les 2 ?chantillons
plot(moy_min_1,
     type="b",
     # 2.
     main="Comparaison des moyennes entre les 2 ?chantillons",
     # 3.
     ylab="Temp?rature (Farhenheit)",
     col="red",
     ylim = c(10, 70)
)

lines(moy_moyenne_1, type="b",col="red")
lines(moy_max_1, type="b",col="red")
lines(moy_min_2, type="b",col="blue")
lines(moy_moyenne_2, type="b",col="blue")
lines(moy_max_2, type="b",col="blue")
legend("bottomleft", legend = c("Moyennes sur ?chantillon 1", "Moyennes sur ?chantillon 2"),
       col = c("red", "blue"), lty = 1:2, cex = 0.8)

#Comparaison des ?carts type entre les 2 ?chantillons
plot(sigma_min_1,
     type="b",
     # 2.
     main="Comparaison des ?carts type entre les 2 ?chantillons",
     # 3.
     ylab="Temp?rature (Farhenheit)",
     col="red",
     ylim = c(10, 20)
)

lines(sigma_moy_1, type="b",col="red")
lines(sigma_max_1, type="b",col="red")
lines(sigma_min_2, type="b",col="blue")
lines(sigma_moy_2, type="b",col="blue")
lines(sigma_max_2, type="b",col="blue")
legend("bottomleft", legend = c("Moyennes sur ?chantillon 1", "Moyennes sur ?chantillon 2"),
       col = c("red", "blue"), lty = 1:2, cex = 0.8)