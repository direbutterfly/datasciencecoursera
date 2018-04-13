pollutantmean = function(directory, pollutant, id=1:332){
  #read the file names
  files = list.files(path = directory,full.names = T)
  #read all the files
  tables <- lapply(files, read.csv, header = TRUE)
  #row bind all files
  specdata = do.call(rbind,tables)
  #calculate the mean
  mean(specdata[specdata$ID %in% id,pollutant],na.rm = T)
}
#pollutantmean("specdata","sulfate")

