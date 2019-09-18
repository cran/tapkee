Tapkee <- function(data, method="pca", td=2, verbose=FALSE, add="", prefix="Dim", rm=TRUE) {
 tmp <- tempfile(c("tapkee_in", "tapkee_out"))
 data <- as.matrix(data)
 if (!is.numeric(data)) stop("All columns must be numeric")
 write.table(data, file=tmp[1], sep=",", row.names=FALSE, col.names=FALSE, quote=FALSE)
 arg <- paste("tapkee", "-i", tmp[1], "-o", tmp[2], "-m", method, "-td", td, 
  ifelse(verbose, "--verbose", ""), add)
 system(arg)
 if (file.exists(tmp[2]) && file.size(tmp[2]) > 0) {
 res <- read.table(tmp[2], sep=",", comment.char="", colClasses="numeric", nrows=nrow(data))
 names(res) <- paste0(prefix, 1:length(names(res)))
 } else {
 warning("No 'tapkee' output, I return your input back. Did you install 'tapkee' properly?")
 res <- data
 }
 if(rm) unlink(tmp)
 return(res)
}
