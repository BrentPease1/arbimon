library(warbleR)

t <- query_xc(qword = 'Antrostomus carolinensis', download = T,  
              path = here('Data/XC/A_carolinensis/test'),
              file.name = c('Date'))



these <- list.files(here('Data/XC/A_carolinensis/test'), full.names = T)

val <- strsplit(these, "-")
new_files <- c()
for(i in 1:length(val)){
  val[[i]][4] <- paste0("_", sample(12:23, size = 1),sample(10:60, size = 1),sample(10:60, size = 1), '.mp3')
  new_files[i] <- paste(val[[i]], collapse = "")

}

file.copy(from = these, to = new_files)
file.remove(these)

m <- mp32wav(path = here('Data/XC/A_carolinensis/test'),
             dest.path = here('Data/XC/A_carolinensis/WAVs'))
