\name{Gen.dr.data}
\alias{Gen.dr.data}

\title{Generates 3D data}

\description{Generates typical 3D dimension reduction data}

\usage{

Gen.dr.data(type, N=1000)

}

\arguments{

\item{type}{one of "swissroll", "scurve" (S-curve), "helix", "ssphere"
(severed sphere)}

\item{N}{number of data points}

}

\details{

'Gen.dr.data()' generates some frequently used 3D data. Formulas taken
partly from 'tapkee' 'borsch' script and partly from Python
'scikit-learn'.

}

% \value{}

% \references{}

\author{Alexey Shipunov}

% \seealso{}

\examples{

# generate four variants of 3D data

SC <- Gen.dr.data("scurve")
SR <- Gen.dr.data("swissroll")
HX <- Gen.dr.data("helix")
SS <- Gen.dr.data("ssphere")

# plot them (requires packages 'scatterplot3d' and 'rgl')

if (requireNamespace("rgl", quietly = TRUE)) {
 COL <- colorRampPalette(c("green", "orange"))(1000)
 scatterplot3d::scatterplot3d(SC, color=COL, pch=20, cex.symbols=1.4)
} else {
  cat("Please install 'rgl' package to see the plot")
}

if (requireNamespace("rgl", quietly = TRUE)) {
 rgl::plot3d(SR, col=rainbow(1100))
} else {
 cat("Please install 'rgl' package to see the plot")
}

if (requireNamespace("rgl", quietly = TRUE)) {
 rgl::plot3d(HX, col=rainbow(1100))
} else {
 cat("Please install 'rgl' package to see the plot")
}

if (requireNamespace("rgl", quietly = TRUE)) {
 rgl::plot3d(SS, col=rainbow(1100))
} else {
  cat("Please install 'rgl' package to see the plot")
}

}

\keyword{Data}
