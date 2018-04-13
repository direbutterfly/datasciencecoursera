complete = function(directory, id=1:332){
  #read the file names
  files = list.files(path = directory,full.names = T)
  #read all the files
  tables <- lapply(files, read.csv, header = TRUE)
  #row bind all files
  specdata = do.call(rbind,tables)
  #calculate the total number of complete cases for each
  df=c()
  for (i in id) {
    temp=sum(!is.na(specdata[specdata$ID==i,]$sulfate) & !is.na(specdata[specdata$ID==i,]$nitrate) )
  df = rbind.data.frame(df,cbind(id=i,nob=temp))
  }
  df
}
#complete("specdata", 1)

