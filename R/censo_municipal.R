#' Censo Nacional de Gobiernos Municipales y Delegacionales
#'
#' Descarga los datos del Censo Nacional de Gobiernos Municipales y Delegacionales (CNGMD),
#'
#' El CNGMD es un proyecto estadistico sobre la gestion y desempeño de las entidades gubernamentales mexicanas a nivel municipal. El CNGMD cubre cuatro tematicas: ayuntamiento, administracion publica municipal, seguridad y justicia.
#'
#' @param fuente Fuente de datos de las instituciones publicas de municipales y delegacionales en formato alfanumerico. Las opciones son: ayuntamiento, administracion, seguridad, justicia.
#' @param year Año del levantamiento del censo en formato numerico. Los años disponibles son 2011, 2013, 2015 y 2017.
#' @param datos Base de datos producida por cada fuente de datos en formato alfanumerico. Las opciones pueden ser, segun la fuente de datos: comision, estructura, integrantes, actividades, funciones, marco, participacion, recursos, tramites, transparencia, ejercicio, infraestructura, y recursos.
#'
#' @examples
#'
#' # Consulta los metadatos del Censo Nacional de Gobiernos Municipales y Delegacionales
#' \dontrun{censo_municipal()}
#'
#' # Descarga los microdatos de la estructura de los ayuntamientos en 2011
#' \dontrun{estruct <- censo_municipal(year = 2011, fuente = "ayuntamiento", datos = "estructura")}
#' @return Data.frame
#' @export

# ====================================================================================================
censo_municipal = function(year = NA, fuente = NA, datos = NA){

# Open Metadata
if (is.na(fuente) & is.na(year) & is.na(datos)) {
  shell.exec("https://www.inegi.org.mx/programas/cngmd/2011/")
  message("\n Cargando pagina... \n")
  # Halt the function without error message
  opt <- options(show.error.messages=FALSE)
  on.exit(options(opt))
  stop()
  }
else if (fuente != "ayuntamiento" & fuente != "administracion"
       & fuente != "seguridad" & fuente != "justicia") {stop(message("Fuente de datos no reconocida"))}
else if (datos != "comision" & datos != "estructura" & datos != "funciones" & datos != "marco" & datos != "participacion" &
         datos != "recursos" & datos != "tramites" & datos != "transparencia" & datos != "ejercicio" &
        datos != "infraestructura" & datos != "recursos" & datos !="integrantes" & datos!="actividades")  {stop(message("Nombre de datos no reconocido"))}
else {}

# Renombrar carpetas y URL  ---------------------------------------------------------------------------
## URL
if      (year == 2011) {
    url.datos.comis = "ayu_comisiones_cngmd"
    url.datos.estru = "ayu_estructura_cngmd"
    url.datos.apest = "apmd_estructura_cngmd"
    url.datos.apfun = "apmd_funciones_cngmd"
    url.datos.apmar = "apmd_marco_cngmd"
    url.datos.appar = "apmd_participacion_cngmd"
    url.datos.aprec = "apmd_recursos_cngmd"
    url.datos.aptra = "apmd_tramites_cngmd"
    url.datos.aptrn = "apmd_transparencia_cngmd"
    url.datos.speje = "sp_ejercicio_cngmd"
    url.datos.spinf = "sp_infraestructura_cngmd"
    url.datos.sprec = "sp_recursos_cngmd"
    url.datos.jmeje = "jm_ejercicio_cngmd"
    url.datos.jminf = "jm_infraestructura_cngmd"
    url.datos.jmrec = "jm_recursos_cngmd"
    folder.comis = "/Comisiones e iniciativas de los Ayuntamientos/Base de datos/"
    folder.estru = "/Estructura de los Ayuntamientos/Base de datos/"
    folder.apest = "/Estructura organizacional/Base de datos/"
    folder.apfun = "/Funciones Especificas/Base de datos/"
    folder.apmar = "/Marco Regulatorio/Base de datos/"
    folder.appar = "/Participacion Ciudadana/Base de datos/"
    folder.aprec = "/Recursos de las Administraciones Publicas Municipales/Base de datos/"
    folder.aptra = "/Tramites y Servicios y Gobierno Electronico/Base de datos/"
    folder.aptrn = "/Transparencia y Anticorrupcion/Base de datos/"
    folder.speje = "/Ejercicio de la Funcion/Base de datos/"
    folder.spinf = "/Infraestructura/Base de datos/"
    folder.sprec = "/Recursos Humanos/Base de datos/"
    folder.jmeje = "/Ejercicio de la Funcion/Base de datos/"
    folder.jminf = "/Infraestructura/Base de datos/"
    folder.jmrec = "/Recursos Humanos/Base de datos/"
}
else if (year == 2013) {
    url.datos.comis = "Com_ini_aytto_cngmd"
    url.datos.estru = "Estruct_aytto_cngmd"
    url.datos.apest = "estructura_organizacional_cngmd"
    url.datos.apfun = "func_esp_cngmd"
    url.datos.apmar = "marco_regulatorio_cngmd"
    url.datos.appar = "participacion_ciudadana_cngmd"
    url.datos.aprec = "recursos_cngmd"
    url.datos.aptra = "tys_gob_elec_cngmd"
    url.datos.aptrn = "transp_cont_int_anticor_cngmd"
    url.datos.speje = "SP_Ejercicio_funcion_cngmd"
    url.datos.spinf = "SP_Infraestructura_cngmd"
    url.datos.sprec = "SP_Recursos_cngmd"
    url.datos.jmeje = "JM_Ejercicio_funcion_cngmd"
    url.datos.jminf = "JM_Infraestructura_cngmd"
    url.datos.jmrec = "JM_Recursos_cngmd"
    folder.comis = "/Com_ini_aytto/Bases_de_datos/"
    folder.estru = "/Estruct_aytto/Bases_de_datos/"
    folder.apest = "/Estructura_organizacional/Bases_de_datos/"
    folder.apfun = "/Func_esp/Bases_de_datos/"
    folder.apmar = "/Marco_regulatorio/Bases_de_datos/"
    folder.appar = "/Participacion_ciudadana/Bases_de_datos/"
    folder.aprec = "/Recursos/Bases_de_datos/"
    folder.aptra = "/TyS_gob_elec/Bases_de_datos/"
    folder.aptrn = "/Transp_cont_int_anticor/Bases_de_datos/"
    folder.speje = "/SP_Ejercicio_funcion/Bases_de_datos/"
    folder.spinf = "/SP_Infraestructura/Bases_de_datos/"
    folder.sprec = "/SP_Recursos/Bases_de_datos/"
    folder.jmeje = "/JM_Ejercicio_funcion/Bases_de_datos/"
    folder.jminf = "/JM_Infraestructura/Bases_de_datos/"
    folder.jmrec = "/JM_Recursos/Bases_de_datos/"
}
else if (year == 2015) {
  url.datos.comis = "m1/Com_ini_aytto_cngmd"
  url.datos.estru = "m1/Estruct_aytto_cngmd"
  url.datos.apest = "m2/Estructura_organizacional_cngmd"
  url.datos.apfun = ""
  url.datos.apmar = "m2/Marco_regulatorio_cngmd"
  url.datos.appar = "m2/Participacion_cuidadana_cngmd"
  url.datos.aprec = "m2/Recursos_cngmd"
  url.datos.aptra = "m2/Tramites_serv_cngmd"
  url.datos.aptrn = "m2/Transparencia_cngmd"
  url.datos.speje = "m3/SP_Ejercicio_funcion_cngmd"
  url.datos.spinf = "m3/sp_Seguridad_publica_cngmd"
  url.datos.sprec = "m3/sp_Recursos_cngmd"
  url.datos.jmeje = "m4/JM_Ejercicio_funcion_cngmd"
  url.datos.jminf = "m4/JM_Infraestuctura_cngmd"
  url.datos.jmrec = "m4/JM_Recursos_cngmd"
  # Nuevas secciones (a partir de 2015)
  # Administracion Publica Municipal
  #"m2/Gob_elec_cngmd"
  #"m2/Plan_evalua_cngmd"
  #"m2/Act_estadis_geograficas_cngmd"
  #"m2/Proteccion_civil_cngmd"
  #"m2/Serv_publicos_cngmd"
  #"m2/Ctrl_inter_anticor_cngmd"
  # CATASTRO
  #"m2/Estructura_organizacional_catastro_cngmd"
  #"m2/Capacitacion_catastro_cngmd"
  #"m2/Programa_modernizacion_catastral_cngmd"
  #"m2/Tecnologias_informacion_catastral_cngmd"
  #"m2/Resguardo_informacion_catastral_cngmd"
  #"m2/Procesos_catastrales_cngmd"
  #"m2/Padron_catastral_cngmd"
  #"m2/Cartografia_catastral_cngmd"
  #"m2/Inspecciones_de_campo_cngmd"
  #"m2/Impuesto_predial_cngmd"
  #"m2/Valuacion_catastral_cngmd"
  #"m2/Vinculacion_catastral_cngmd"

  # AGUA POTABLE Y SANEAMIENTO
  #"m5/Serv_agua_red_cngmd"
  #"m5/Capta_agua_public_cngmd"
  #"m5/Admin_agua_red_cngmd"
  #"m5/Drenaje_alcant_cngmd"
  #"m5/Trat_aguas_resid_cngmd"
  #"m5/Aguas_sintrat_cngmd"
  #"m5/Prog_gest_aguapot_cngmd"
  #"m5/Aguas_sintrat_cngmd"
  #"m5/Prog_gest_aguapot_cngmd"
  #"m5/Difus_gest_agua_cngmd"

  # RESIDUOS SOLIDOS Y URBANOS
  #"m6/Rec_RSU_cngmd"
  #"m6/Trat_RSU_cngmd"
  #"m6/Disp_final_RSU_cngmd"
  #"m6/Est_gen_comp_RSU_cngmd"
  #"m6/Prog_gest_int_RSU_cngmd"
  #"m6/Part_ciud_RSU_cngmd"

  folder.comis = paste0("/Com_ini_aytto_cngmd", year, "_dbf/Bases_de_datos/")
  folder.estru = paste0("/Estruct_aytto_cngmd", year, "_dbf/Bases_de_datos/")
  folder.apest = "//Bases_de_datos/"
  folder.apfun = "//Bases_de_datos/"
  folder.apmar = "//Bases_de_datos/"
  folder.appar = "//Bases_de_datos/"
  folder.aprec = "//Bases_de_datos/"
  folder.aptra = "//Bases_de_datos/"
  folder.aptrn = "//Bases_de_datos/"
  folder.speje = "//Bases_de_datos/"
  folder.spinf = "//Bases_de_datos/"
  folder.sprec = "//Bases_de_datos/"
  folder.jmeje = "//Bases_de_datos/"
  folder.jminf = "//Bases_de_datos/"
  folder.jmrec = "//Bases_de_datos/"
}
else if (year == 2017) {
  url.datos.integ = "m1/Integrantes_ayuntami_cngmd"
  url.datos.activ = "m1/Actividad_ayuntami_cngmd"
  url.datos.apest = "m2/Estruc_organizacional_cngmd"
  url.datos.apfun = ""
  url.datos.apmar = "m2/Marco_regulatorio_cngmd"
  url.datos.appar = "m2/Participacion_ciudada_cngmd"
  url.datos.aprec = ""
  url.datos.aptra = "m2/Tramites_servicios_cngmd"
  url.datos.aptrn = "m2/Transparencia_cngmd"
  url.datos.speje = "m3/Ejercicio_func_espec_cngmd"
  url.datos.spinf = "m3/Infraestructura_SP_cngmd"
  url.datos.sprec = "m3/Recursos_SP_cngmd"
  url.datos.jmeje = "m4/Ejercicio_funcion_cngmd"
  url.datos.jminf = "m4/Infraestructura_cngmd"
  url.datos.jmrec = "m4/Recursos_humanos_cngmd"
  # Nuevas Bases de Datos 2017
  # ADMINISTRACION PUBLICA  ----------------------------------
  # m2/Rec_presupuestal_cngmd
  # m2/Rec_materiales_cngmd
  # m2/Gobierno_electronico_cngmd
  # m2/Activ_estadist_geogra_cngmd
  # m2/Planea_evaluacion_cngmd
  # m2/Proteccion_civil_cngmd
  # m2/Recpresu_trans_accpro_cngmd
  # m2/Solic_acceso_protecc_cngmd
  # m2/Capac_trans_accprot_cngmd
  # m2/Admon_archivo_gestion_cngmd
  # m2/Capac_admon_gestion_cngmd
  # m2/Rec_admon_gestiondoc_cngmd
  # m2/Recpres_admon_gestion_cngmd
  # m2/Planea_admon_gestion_cngmd
  # m2/Sist_instituc_archivo_cngmd
  # m2/Documento_electronico_cngmd
  # m2/Sist_gestion_control_cngmd
  # m2/Servicios_publicos_cngmd
  # m2/Ctrl_inter_anticor_cngmd
  # CATASTRO  ------------------------------------------------
  # m2/Estruc_organ_catastro_cngmd
  # m2/Capacitacion_catastro_cngmd
  # m2/Prog_moderni_catastral_cngmd
  # m2/Tecno_infor_catastral_cngmd
  # m2/Resguar_inf_catastral_cngmd
  # m2/Procesos_catastrales_cngmd
  # m2/Padron_catastral_cngmd
  # m2/Cartografia_catastral_cngmd
  # m2/Inspecciones_campo_cngmd
  # m2/Impuesto_predial_cngmd
  # m2/Valuacion_catastral_cngmd
  # m2/Vinculacion_catastral_cngmd
  # PLANEACION Y GESTION TERRITORIAL  -----------------------
  # m2/Admin_pub_territorio_cngmd
  # m2/Marco_regulatorio_ter_cngmd
  # m2/Reserv_territoriales_cngmd
  # m2/Asent_human_irregu_cngmd
  # m2/Asen_hum_zona_riesg_cngmd
  # m2/Desarr_urbano_ecc_cngmd
  # m2/Coordininst_intercinf_cngmd
  # SEGURIDAD PUBLICA  --------------------------------------
  # m3/Infoestadistica_SP_cngmd
  # m3/Interven_policiamun_cngmd
  # m3/Presunta_infracdelito_cngmd
  # m3/Probable_victima_reg_cngmd
  # m3/Probable_infractor_cngmd
  # m3/Mando_unico_policial_cngmd
  # M7 - AGUA POTABLE Y SANEAMIENTO  -----------------------------
  # m5/Serv_agua_red_cngmd
  # m5/Capta_agua_public_cngmd
  # m5/Plantas_pot_cngmd
  # m5/Admin_agua_red_cngmd
  # m5/Drenaje_alcant_cngmd
  # m5/Trat_aguas_resid_cngmd
  # m5/Aguas_sintrat_cngmd
  # m5/Prog_gest_aguapot_cngmd
  # m5/Difus_gest_agua_cngmd
  # M8 - RESIDUOS SOLIDOS URBANOS  -------------------------------
  # m6/Rec_RSU_cngmd
  # m6/Trat_RSU_cngmd
  # m6/Disp_final_RSU_cngmd
  # m6/Est_gen_comp_RSU_cngmd
  # Est_gen_comp_RSU_cngmd
  # m6/Prog_gest_int_RSU_cngmd
  # m6/Part_ciud_RSU_cngmd
  folder.integ = "//Bases_Datos/"
  folder.activ = "//Bases_Datos/"
  folder.apest = "//Bases_Datos/"
  folder.apfun = "//Bases_Datos/"
  folder.apmar = "//Bases_Datos/"
  folder.appar = "//Bases_Datos/"
  folder.aprec = "//Bases_Datos/"
  folder.aptra = "//Bases_Datos/"
  folder.aptrn = "//Bases_Datos/"
  folder.speje = "//Bases_Datos/"
  folder.spinf = "//Bases_Datos/"
  folder.sprec = "//Bases_Datos/"
  folder.jmeje = "//Bases_Datos/"
  folder.jminf = "//Bases_Datos/"
  folder.jmrec = "//Bases_Datos/"
}
else {}

# URL Por fuente y datos
if      (fuente == "ayuntamiento" & datos == "comision")     {url.complemento = url.datos.comis}
else if (fuente == "ayuntamiento" & datos == "estructura")   {url.complemento = url.datos.estru}
else if (fuente == "ayuntamiento" & datos == "integrantes")   {url.complemento = url.datos.integ}
else if (fuente == "ayuntamiento" & datos == "actividades")   {url.complemento = url.datos.activ}
else if (fuente == "administracion" & datos == "estructura") {url.complemento = url.datos.apest}
else if (fuente == "administracion" & datos == "funciones")  {url.complemento = url.datos.apfun}
else if (fuente == "administracion" & datos == "marco")      {url.complemento = url.datos.apmar}
else if (fuente == "administracion" & datos == "participacion") {url.complemento = url.datos.appar}
else if (fuente == "administracion" & datos == "recursos")      {url.complemento = url.datos.aprec}
else if (fuente == "administracion" & datos == "tramites")      {url.complemento = url.datos.aptra}
else if (fuente == "administracion" & datos == "transparencia") {url.complemento = url.datos.aptrn}
else if (fuente == "seguridad" & datos == "ejercicio")          {url.complemento = url.datos.speje}
else if (fuente == "seguridad" & datos == "infraestructura")    {url.complemento = url.datos.spinf}
else if (fuente == "seguridad" & datos == "recursos")           {url.complemento = url.datos.sprec}
else if (fuente == "justicia" & datos == "ejercicio")           {url.complemento = url.datos.jmeje}
else if (fuente == "justicia" & datos == "infraestructura")     {url.complemento = url.datos.jminf}
else if (fuente == "justicia" & datos == "recursos")            {url.complemento = url.datos.jmrec}

# Folders por fuente y datos
if      (fuente == "ayuntamiento" & datos == "comision")       {folder.complemento = folder.comis}
else if (fuente == "ayuntamiento" & datos == "estructura")     {folder.complemento = folder.estru}
else if (fuente == "ayuntamiento" & datos == "integrantes")     {folder.complemento = folder.integ}
else if (fuente == "ayuntamiento" & datos == "actividades")     {folder.complemento = folder.activ}
else if (fuente == "administracion" & datos == "estructura") {folder.complemento = folder.apest}
else if (fuente == "administracion" & datos == "funciones")  {folder.complemento = folder.apfun}
else if (fuente == "administracion" & datos == "marco")      {folder.complemento = folder.apmar}
else if (fuente == "administracion" & datos == "participacion") {folder.complemento = folder.appar}
else if (fuente == "administracion" & datos == "recursos")      {folder.complemento = folder.aprec}
else if (fuente == "administracion" & datos == "tramites")      {folder.complemento = folder.aptra}
else if (fuente == "administracion" & datos == "transparencia") {folder.complemento = folder.aptrn}
else if (fuente == "seguridad" & datos == "ejercicio")          {folder.complemento = folder.speje}
else if (fuente == "seguridad" & datos == "infraestructura")    {folder.complemento = folder.spinf}
else if (fuente == "seguridad" & datos == "recursos")           {folder.complemento = folder.sprec}
else if (fuente == "justicia" & datos == "ejercicio")           {folder.complemento = folder.jmeje}
else if (fuente == "justicia" & datos == "infraestructura")     {folder.complemento = folder.jminf}
else if (fuente == "justicia" & datos == "recursos")            {folder.complemento = folder.jmrec}
else {}

### Descargar  -----------------------------------------------------------------------------------------
#else {stop("Nombre de fuente no reconocida en la base de datos. Revisa el Diccionario de Datos utilizando la función CatalogoInegi()")}

  # Temp files
  fformat    = "dbf"
  temp.cngmd = tempfile()
  zipdir     = tempdir()

  # Descargar
  url.base = paste0("https://www.inegi.org.mx/contenidos/programas/cngmd/", year, "/microdatos/m1/", url.complemento, year, "_", fformat, ".zip")
  utils::download.file(url.base, temp.cngmd)
  utils::unzip(temp.cngmd, exdir = zipdir)
  list_dataraw = as.list(list.files(paste0(zipdir, folder.complemento)))

  # Read all .dbf files in the folder
  for (i in list_dataraw) {
    Object = foreign::read.dbf(paste0(zipdir, folder.complemento, i), as.is = TRUE)
    Object$UBIC_GEO = paste0(formatC(as.character(Object$UBIC_GEO), width=5, flag="0"))
    assign(paste0("dt.", tools::file_path_sans_ext(i)), Object)
  }
  list_dataclean = mget(ls(pattern = "dt."))

# Return Object
return(list_dataclean)
  message("Se ha creado una lista con varias bases de datos")
} # End of Function
