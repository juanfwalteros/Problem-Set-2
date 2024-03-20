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