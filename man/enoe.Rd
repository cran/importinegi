% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/enoe.R
\name{enoe}
\alias{enoe}
\title{ENOE}
\usage{
enoe(year = NA, trimestre = NA, integrar = FALSE)
}
\arguments{
\item{year}{Año de levantamiento de la encuesta en formato numerico.}

\item{trimestre}{Trimestre de levantamiento de la encuesta en formato alfanumerico. Las opciones son: "trim1", "trim2", "trim3" y "trim4".}

\item{integrar}{\code{FALSE}: descarga por separado y en una lista las cinco bases de datos que componen la ENOE. \code{TRUE}: integra las cinco bases de datos en una sola, utilizando el identificador unico del entrevistado.}
}
\value{
Data.frame
}
\description{
Encuesta Nacional de Ocupacion y Empleo (ENOE)
}
\details{
La ENOE es un proyecto estadistico de encuestas en hogares especializado en informacion sobre el mercado laboral. La ENOE provee informacion trimestral sobre la fuerza laboral, la ocupacion, subocupacion y desocupacion de los miembros del hogar encuestado.
}
\examples{

# Descargar las bases de datos de la ENOE 2009, Trimestre 1, sin integrar.
\dontrun{enoe(year = 2009, trimestre = "trim1")}

# Descargar las bases de datos de la ENOE 2009, Trimestre 1, integradas
\dontrun{enoe(year = 2009, trimestre = "trim1", integrar = TRUE)}
}
