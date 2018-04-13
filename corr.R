source("complete.R")
corr = function(directory, threshold){
  #read the file names
  files = list.files(path = directory,full.names = T)
  #read all the files
  tables <- lapply(files, read.csv, header = TRUE)
  #row bind all files
  specdata = do.call(rbind,tables)
  #get the id's which meet the threshold constraint
  all_cases = complete("specdata")
  id_threshold = as.vector(all_cases[all_cases$nob>threshold,"id"])
  cor_vec=c()
  for (i in id_threshold){
    data=specdata[specdata$ID==i,]
    cor_vec = c(cor_vec,cor(data$sulfate,data$nitrate,use = "pairwise.complete.obs"))  
  }
  cor_vec
}
