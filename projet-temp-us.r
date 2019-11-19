data <- read.csv(file.choose(), sep = ",", fill =TRUE)
head(data)
#californie, louisiane, ohio, minnesota, montana

mydata=subset(data, State.Name=="California" | State.Name=="Louisiana" | State.Name=="Ohio" | State.Name=="Minnesota" | State.Name=="Montana")
mydata <- mydata[,c("State.Name", "X1st.Max.Value", "Arithmetic.Mean")]

#Comme la moyenne est une moyenne arithmétique, on peut déterminer
#la température minimale à partir de la moyenne et de la température
#maximale
temp_minimale=2*mydata$Arithmetic.Mean-mydata$X1st.Max.Value
mydata$temp_minimale=temp_minimale

#Graphique pas fini lol
plot(temp_minimale,
     type="h",
     # 2.
     main="Corrélation entre les 3 variables statistiques",
     # 3.
     xlab="Nombre de mesures",
     ylab="Température",
     col="red"
)