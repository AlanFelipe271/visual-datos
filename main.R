################################################################################
# ----- PROYECTO DE VISUALIZACIIÓN DE DATOS -------------------------
# Los datos son viajes de uber

library(readr)
library(dplyr)
library(lubridate)
library(ggplot2)
library(ggthemes)

df <- read_csv("uber_stock_data.csv")

str(df)
names(df)
head(df)

# Ordenamos el dataset por fechas
df$Date <- as.Date(df$Date, format = "%Y-%m-%d")
df <- df %>%
  arrange(Date)
head(df)


# Gráfico el volumen de cada mes en cada año
df_fil19 <- df %>%
  filter(year(Date) == 2019)

df_fil20 <- df %>%
  filter(year(Date) == 2020)

df_fil21 <- df %>%
  filter(year(Date) == 2021)

df_fil22 <- df %>%
  filter(year(Date) == 2022)

# 2019
plot(df_fil19$Date, df_fil19$Volume, 
     xlab = "Dias del año",
     ylab = "Volumen de viajes",
     main = "Viajes de Ubers en 2019",
     type = "l", col = "darkred",
     family = "serif")

# 2020
plot(df_fil20$Date, df_fil20$Volume, 
     xlab = "Dias del año",
     ylab = "Volumen de viajes",
     main = "Viajes de Ubers en 2020",
     type = "l", col = "darkblue",
     family = "serif")

# 2021
plot(df_fil21$Date, df_fil21$Volume, 
     xlab = "Dias del año",
     ylab = "Volumen de viajes",
     main = "Viajes de Ubers en 2021",
     type = "l", col = "darkgreen",
     family = "serif")
# 2022

plot(df_fil22$Date, df_fil22$Volume,
     xlab = "Dias del año",
     ylab = "Volumen de viajes",
     main = "Viajes de Ubers en 2022",
     type = "l", col = "purple",
     family = "serif")


# Con ggplot2
ggplot(df_fil19, aes(df_fil19$Date, df_fil19$Volume)) +
  geom_line(color = "red", size = 1.2, linetype = "solid") +
  geom_point(color = "darkred", size = 1)+
  theme_solarized(base_family = "serif") +
  labs(x = "Días del año",y = "Número de viajes",
  title = "Viajes de Ubers en 2019")

