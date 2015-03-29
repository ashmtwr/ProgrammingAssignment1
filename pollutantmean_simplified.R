pollutantmean_simp <- function(directory, pollutant, id = 1:332) {
        dir <- directory
        file.list <- list.files(dir)
        file.names <- as.numeric(sub("\\.csv","",file.list))
        user.selection <- file.list[match(id,file.names)]
        data.extract <- lapply(file.path(dir,user.selection),read.csv)
        extract.frame <- do.call(rbind.data.frame,data.extract)
        data.mean <- mean(extract.frame[,pollutant],na.rm=TRUE)
        round(data.mean,3)
        }