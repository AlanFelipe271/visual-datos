################################################################################
# ----- PROYECTO DE VISUALIZACIIÓN DE DATOS -------------------------
# Los datos son viajes de uber

library(readr)
library(dplyr)
library(lubridate)
df <- read_csv("uber_stock_data.csv")

str(df)
names(df)
head(df)

# Ordenamos el dataset por fechas
df <- df %>%
  arrange(Date)
head(df)


# Gráfico el volumen de cada mes en cada año
df_fil19 <- df %>%
  filter(year(Date) == 2019)

plot(df_fil19$Date, df_fil19$Volume, data = df_fil19, 
     xlab = "Dias del año",
     ylab = "Volumen de viajes",type = "l",
     family = "serif")
