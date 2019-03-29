.onAttach <- function(libname, pkgname) {
 Tp.ver <- read.dcf(file=system.file("DESCRIPTION", package=pkgname), fields="Version")
 packageStartupMessage(paste("package 'tapkee', version", Tp.ver))
}
