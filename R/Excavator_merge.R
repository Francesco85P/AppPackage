#' Title
#'
#' @param file_path_target_bed 
#' @param file_path_HSLM 
#' @param merged_file_name 
#'
#' @returns the merged file (HSLM input for Plot_visualization)
#' @export
#'
#' @examples Excavator_merge_bed(my_file_path_target_bed, my_file_path_HSLM, EXcmy_merged_file_name)
Excavator_merge_bed <- function(file_path_target_bed, file_path_HSLM, merged_file_name = "merged_data.txt"){
 
  library(dplyr)
  library(stringr)
  
  
HSLM <- utils::read.table(file_path_HSLM, fill=T, quote="\"", sep="\t", h = T) 
target_bed <-  target_data <-utils::read.table(file_path_target_bed, quote="\"",fill=T,
  col.names= c("Chromosome","Start","End", "Exon"))
  

file_path_output <- paste0(stringr::str_remove(file_path_HSLM, '/[^/]*\\..*'),"/",merged_file_name)
merge_data <- dplyr::left_join(HSLM,target_bed,by=c("Chromosome","Start", "End"))
utils::write.table(merge_data, file_path_output, quote = FALSE, row.names = FALSE, sep = "\t")  
}

