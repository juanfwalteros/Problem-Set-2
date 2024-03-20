## Clase 06
## Eduard Martinez
## Update: 2024-02-13

## [1.] Checklist
### Lectures previas
### Script de la clase
### Versión de R
R.version.string

### Librerías
# Instalar/llamar pacman
require("pacman")

# Usar la función p_load de pacman para instalar/llamar las librerías de la clase
p_load(rio, skimr, janitor, tidyverse)
dplyr::filter() ##para especificar que quiero comando filter de dplyr
filter <- dplyr::filter

## [2.] ¿Qué es tidy-data?
### 2.1. Raw data y tidy data
### 2.2. Reglas de un conjunto de datos tidy
### 2.3. tidyverse
# Instalar y cargar el tidyverse en su entorno de R
library("tidyverse")
filter <- dplyr::filter #defino que solo filter es para dplyr

## [3.] Adicionar variables a un conjunto de datos

### 3.1. Leer conjuto de datos
db <- import("input/Saber_11__2020-1.csv") #importo la base de datos
skim(db) #me da caracteristicas de la base


### 3.2 Función `$`
hist(db$PUNT_GLOBAL)
summary(db$PUNT_GLOBAL) #el signo $ me llama a la variable
db$punt_norm <- rnorm(n = nrow(db))
db$punt_norm <- rnorm(n = 15435) #este y pasado son iguales. creo variable
db$punt_global2 <- db$PUNT_GLOBAL/mean(db$PUNT_GLOBAL) #lo divido entre el promedio


### 3.3 mutate()
df <- mutate(.data = db , constante = 1 , norm = rnorm(15435), 
             global_ingles = PUNT_GLOBAL/PUNT_INGLES) #creo una nueva base con una constante nueva

### 3.4 Generar variables usando condicionales:

## Una condicion
df <- mutate(df, d_global=ifelse(test = PUNT_GLOBAL>=mean(PUNT_GLOBAL),
                                 yes = 1,
                                 no = 0))
table(df$d_global)

## varias condiciones
df <- mutate(df,
             d_250_f=ifelse(ESTU_GENERO=="F"&PUNT_GLOBAL>=250,1,0))
table(df$d_250_f)

set.seed(123)
df <- mutate(df, edad=runif(15435,15,35)) #creo una variable ficticia de edad
hist(df$edad)

df <- mutate(df, 
             rango_edad= case_when(edad>=15&edad<18~"Ado",
                                   edad>=18&edad<28~"Adulto",
                                   edad>=28~"Abuelo"))
table(df$rango_edad)

### 3.5 Aplicar funciones a variables


## [4.] Remover filas y/o columnas



### 4.1 Seleccionar variables
df$edad = NULL
df <- select(.data=df, ESTU_TIPODOCUMENTO, PUNT_GLOBAL)
df2 <- select(.data = df , -ESTU_TIPODOCUMENTO, -PUNT_GLOBAL)
df4 <- select(.data = db, -PUNT_INGLES:-PUNT_GLOBAL)
df5 <- select(db,starts_with("PUNT_"))

### 4.2 Remover filas/observaciones





