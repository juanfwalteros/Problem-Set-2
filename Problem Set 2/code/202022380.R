#Juan Francisco Walteros 202022380

#Problem Set 2

#R version 4.3.2 (2023-10-31 ucrt) -- "Eye Holes"

require(pacman)

p_load(tidyverse,rio,skimr,janitor,data.table)

rm(list=ls())

#1. Importar/exportar bases de datos

setwd("C:/Users/juanf/OneDrive - Universidad de los Andes/Octavo/Taller R/Problem Set 2/Problem-Set-2/Problem Set 2")

identification <- import("input/Modulo de identificacion.dta") %>% clean_names()

location <- import("input/Modulo de sitio o ubicacion.dta") %>% clean_names()

export(identification,"output/identification.rds")

export(location,"output/location.rds")


#2. Generar variables

table(identification$grupos4)

identification <- mutate(identification, 
                         business_type=case_when(grupos4=="01"~"Agricultura",
                                                 grupos4=="02"~"Industria manufacturera",
                                                 grupos4=="03"~"Comercio",
                                                 grupos4=="04"~"Servicios"))

summary(identification$p241)
#Haciendo un summary, se ven los 4 cuartiles de las edades. Los grupos etarios estan hechos con los cuatro cuartiles.
#Primer, segundo, tercer y cuarto cuartil respectivamente para cada grupo etario que corresponde con lo encontrado en summary.

identification <- mutate(identification,
                         grupo_etario=case_when(p241>=18&p241<34~"Primer",
                                                p241>=34&p241<45~"Segundo",
                                                p241>=45&p241<56~"Tercer",
                                                p241>=56&p241<100~"Cuarto"))

summary(location$p3053)

location <- mutate(location,
                   ambulante=case_when(p3053>=3&p3053<6~1))

#3. Eliminar filas/columnas de un conjunto de datos

identification_sub <- select(identification, directorio,secuencia_p,secuencia_encuesta,
                             grupo_etario,cod_depto,f_exp)
#Aqui no inclui la variable ambulante porque no puede existir en la base de identification.
#Supuse que la instruccion estaba mal dado que en el punto siguiente unimos las bases.

location_sub <- select(location, directorio,secuencia_p,secuencia_encuesta,
                       ambulante,p3054,p469,cod_depto,f_exp)

#4. Combinar bases de datos

base_sub <- left_join(x = identification_sub, y = location_sub, by = c("directorio",
                                                                       "secuencia_p","secuencia_encuesta"))

#Aqui uni las bases con left_join tomando como x la base de identification_sub
#Use left_join porque identification_sub es la base que contiene los datos base de los encuestados

#5. Descriptivas

skim(base_sub)
#Skim me muestra un resumen de base_sub. Aqui puedo ver informacion como cantidad de observaciones, variables y su tipo
#Tambien me muestra histogramas, medias, desviaciones estandar y missing values de cada variable

summary(base_sub)
#Summary me muestra minimos, cuartiles, medias, medianas, maximos y missing values para cada variable


### **2.1 Generales**

# Utilice summary para una descripción general 
summary(geih$p6040)

# select + summarize_all 
select (.data=geih,
        p6020,p6040,p6500) |> summarize_all(mean)

### **2.2 Agrupadas**

# ingreso laboral promedio por sexo
geih |> group_by(p6020) |> 
  summarise(ing_mean=mean(p6500,na.rm=T)) #group_by es categoria por la que agrupa info

geih <- mutate(geih,mujer=ifelse(p6020==2,1,0))

geih |> group_by(mujer) |> summarize(ing_mean=mean(p6500,na.rm=T))

# ingreso laboral promedio por sexo y tipo de 

geih |> group_by(mujer,p6450) |> summarize(ing_mean=mean(p6500,na.rm=T))

# ingreso laboral promedio/mediano y años promedio en fondo de pension por sexo

geih |> group_by(mujer,p6450) |> summarize(ing_mean=mean(p6500,na.rm=T),
                                           med_edad=median(p6040,na.rm=T))

