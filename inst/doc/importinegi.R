## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE------------------------------------------------------------
#  # Accede a la documentacion del Censo Nacional de Derechos Humanos Estatal 2018
#  catalogo_inegi(id = 443)

## ---- eval = FALSE------------------------------------------------------------
#  # Descarga y almacena el catalogo de proyectos estadisticos del INEGI
#  catalogoINEGI = catalogo_inegi()

## ---- eval = FALSE------------------------------------------------------------
#  # Default: a nivel localidad, pero sin datos a nivel estado ni municipio
#  censo.jalisco = censo_poblacion_iter(year = 2010, estado == "Jalisco")
#  
#  # Datos a nivel estado, municipio y localidad
#  censo.jalisco = censo_poblacion_iter(year = 2010, estado == "Jalisco", totalestado = TRUE, totalmunicipio = TRUE)
#  
#  # Datos a nivel estado y municipio, pero sin datos a nivel localidad
#  censo.jalisco = censo_poblacion_iter(year = 2010, estado == "Jalisco", totalestado = TRUE, totalmunicipio = TRUE, localidades = FALSE)
#  
#  # Datos a nivel nacional
#  censo.jalisco = censo_poblacion_iter(year = 2010, estado == "Nacional")

## ---- eval = FALSE------------------------------------------------------------
#  # Descarga cuestionario de personas
#  muestra.jalisco = censo_poblacion_muestra(year = 2010, estado = "Jalisco", muestra = "Personas")

## ---- eval = FALSE------------------------------------------------------------
#  # Acceder a la documentacion en linea del CNGDM
#  censo_municipal()

## ---- eval = FALSE------------------------------------------------------------
#  # Descargar conjunto de datos "comision" del censo 2011
#  datos.comision = censo_municipal(year = 2011, fuente = "ayuntamiento", datos = "comision")

## ---- eval = FALSE------------------------------------------------------------
#  # Explorar la posición de cada base de datos en la lista
#  summary(datos.comision)
#  
#  # Extraer la base de datos ACT_AYUN, en la posición 1
#  datos.actas = datos.comision[[1]]

## ---- eval = FALSE------------------------------------------------------------
#  # Default: descargar datos de viviendas
#  viviendas14 = enigh_nuevaconstruccion(year = 2014, datos = "viviendas")
#  
#  # Descargar datos de hogares
#  hogares14 = enigh_nuevaconstruccion(year = 2014,  datos = "hogares")
#  
#  # Descargar datos de agro
#  agro14 = enigh_nuevaconstruccion(year = 2014, datos = "agro")

## ---- eval = FALSE------------------------------------------------------------
#  # Crear un objeto con las cinco bases de datos de la ENOE, separadas.
#  lista.enoe05 = enoe(year = 2005, trimestre = "trim1")

## ---- eval = FALSE------------------------------------------------------------
#  #  Resumen de las cinco bases de datos
#  summary(lista.enoe05)

## ---- eval = FALSE------------------------------------------------------------
#  # Identificar y extraer base de datos del cuestionario hogares
#  dt.hog105 = dt.enoe05[[3]]

## ---- eval = FALSE------------------------------------------------------------
#  # Descargar e integrar datos de la ENOE Trimestre I datos de la ENOE, integradas.
#  lista.enoe = enoe(year = 2005, trimestre = "trim1", integrar = TRUE)

## ---- eval = FALSE------------------------------------------------------------
#  # Descargar el MGN de 1995
#  mapa.estados95 <- sig_marcogeo(year = 1995, mapa = "entidades")
#  
#  # Visualizar mapa basico
#  plot(mapa.estados95)

## ---- eval = FALSE------------------------------------------------------------
#  # Descargar mapas de la RNC de 2019
#  mapas.rnc <- sig_caminos_descarga(year = 2019)

## ---- eval = FALSE------------------------------------------------------------
#  # Obtener un mapa de puentes
#  mapa.puentes <- sig_caminos_extrae(mapas.rnc, mapa = "puente")

