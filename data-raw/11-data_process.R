##################
# RomiIT - Codes #
##################

Rfuns::load_pkgs('data.table')

# Read all files `ZONE`
yz <- rbindlist(lapply(
          list.files(file.path(omi_path$input, 'QI'), 'ZONE', full.names = TRUE), 
          \(x) data.table(termine = gsub('.*_([0-9]{5})_.*$', '\\1', x), fread(x) )
))

# Read all files `VALORI`
yv <- rbindlist(lapply(
          list.files(file.path(omi_path$input, 'QI'), 'VALORI', full.names = TRUE), 
          \(x) data.table(periodo = gsub('.*_([0-9]{5})_.*$', '\\1', x), fread(x, select = c(5, 9:21)) )
))

# Comuni
yt <- unique(yz[, c(1:6, 8:9)]) 
setnames(yt, c('termine', 'RPTd', 'RGNd', 'PRVs', 'CMN', 'nazionale', 'catasto', 'CMNd'))
yt[, `:=`(
        CMN = as.integer(substring(CMN, nchar(CMN) - 5)),
        RGNd = gsub('(.*)/.*$', '\\1', RGNd)
)]
yt[CMN < 1000, CMN := NA]
yt <- yt[yt[, .I[which.max(termine)], catasto]$V1]
yt[termine == max(termine), termine := NA]
setcolorder(yt, c('CMN', 'catasto', 'nazionale', 'CMNd', 'PRVs', 'RGNd', 'RPTd', 'termine'))
setorder(yt, 'CMN')
save_dts_pkg(yt, 'comuni', omi_path$output, dbn = 'it_omi')

# Zone
yt <- yz[, .(termine, Comune_amm, LinkZona, Zona_Descr, Fascia, Zona, Cod_tip_prev, Stato_prev, Microzona)]
setnames(yt, c('termine', 'catasto', 'OMIk', 'OMId', 'fascia', 'zona', 'cod_prev', 'stato_prev', 'microzona'))
yt[, OMI := paste0(catasto, str_add_char(zona, 4))]
yt <- yt[yt[, .I[which.max(termine)], OMI]$V1]
yt[microzona == 999, microzona := NA]
yt[, `:=`( OMId = trimws(gsub("^'|'$|^-{0,2}|^-", '', OMId)), termine = NULL )]
yt[yt == ''] <- NA
setcolorder(yt, c('catasto', 'OMI'))
setorder(yt, 'OMI')
save_dts_pkg(yt, 'zone', omi_path$output, dbn = 'it_omi')

# USO PREVALENTE
yt <- fread('./data-raw/uso_prevalente.csv')
save_dts_pkg(yt, 'uso_prevalente', omi_path$output, dbn = 'it_omi')



rm(list = ls())
gc()
