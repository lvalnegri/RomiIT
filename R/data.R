#' @importFrom data.table data.table
NULL

#' comuni
#'
#' Elenco dei Comuni 
#' 
#' @format A data.table with the following columns:
#' \describe{
#'   \item{\code{ CMN }}{  }
#'   \item{\code{ catasto }}{  }
#'   \item{\code{ nazionale }}{  }
#'   \item{\code{ CMNd }}{  }
#'   \item{\code{ PRVs }}{  }
#'   \item{\code{ RGNd }}{  }
#'   \item{\code{ RPTd }}{  }
#'   \item{\code{ termine }}{  }
#' }
#'
'comuni'

#' zone
#'
#' Elenco delle Zone OMI all'ultima 
#' 
#' @format A data.table with the following columns:
#' \describe{
#'   \item{\code{ catasto }}{  }
#'   \item{\code{ OMI }}{  }
#'   \item{\code{ OMIk }}{  }
#'   \item{\code{ OMId }}{  }
#'   \item{\code{ fascia }}{  }
#'   \item{\code{ zona }}{  }
#'   \item{\code{ cod_prev }}{  }
#'   \item{\code{ stato_prev }}{  }
#'   \item{\code{ microzona }}{  }
#' }
#'
'zone'

#' uso_prevalente
#'
#' Elenco degli usi prevalenti nelle zone, suddivise per macro-categorie 
#' 
#' @format A data.table with the following columns:
#' \describe{
#'   \item{\code{ codice }}{  }
#'   \item{\code{ descrizione }}{  }
#'   \item{\code{ gruppo }}{  }
#'   \item{\code{ ordine }}{  }
#' }
#'
'uso_prevalente'


#' @import sf
NULL

#' OMI
#'
#' Confini geografici delle Zone OMI in formato `sf` in formato geodetico `WGS84` (ultim,o aggiornamento: II semestre 2021).
#'
'object_name'

