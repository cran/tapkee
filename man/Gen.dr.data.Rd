\name{Gen.dr.data}
\alias{Gen.dr.data}

\title{Generates 3D data}
\description{Generates typical 3D dimension reduction data}

\usage{
Gen.dr.data(type, N=1000)
}

\arguments{
\item{type}{one of "swissroll", "scurve" (S-curve), "helix", "ssphere" (severed sphere)}
\item{N}{number of data points}
}

\details{
'Gen.dr.data()' generates typical 3D data. Formulas taken partly from 'tapkee' 'borsch' script and partly from Python 'scikit-learn'.
}

% \value{}

% \references{}

\author{Alexey Shipunov}

% \seealso{}

\examples{
SR <- Gen.dr.data("swissroll")
rgl::plot3d(SR, col=rainbow(1100))

SC <- Gen.dr.data("scurve")
scatterplot3d::scatterplot3d(SC, color=colorRampPalette(c("green", "orange"))(1000),
  pch=20, cex.symbols=1.4)

HX <- Gen.dr.data("helix")
rgl::plot3d(HX, col=rainbow(1100))

SS <- Gen.dr.data("ssphere")
rgl::plot3d(SS, col=rainbow(1100))
}

\keyword{Data}
