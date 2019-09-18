\name{Tapkee}
\alias{Tapkee}

\title{Tapkee wrapper}
\description{R wrapper for the 'tapkee' dimension reduction library}

\usage{
Tapkee(data, method="pca", td=2, verbose=FALSE, add="", prefix="Dim", rm=TRUE)
}

\arguments{
\item{data}{R numerical matrix or data frame (will be converted into matrix)}

\item{method}{'tapkee' method, run "system('tapkee -h')" for the list, default is "pca"}

\item{td}{Number of dimensions to output, default is 2}

\item{verbose}{If TRUE, 'tapkee' is verbose, defalut is FALSE}

\item{add}{'tapkee' additional arguments as character string: see "system('tapkee -h')"}

\item{prefix}{Variable name prefix in the resulted data frame, default is "Dim"}

\item{rm}{Remove temp files (but temp folder will be removed anyway in the end of R session), default is TRUE}
}

\details{
Interface (wrapper) for the 'tapkee', flexible and efficient C++ template library for dimension reduction.
'tapkee' is extremely fast comparing with other DR tools.

For methods used in 'tapkee', run 'vignette(tapkee_methods)'.

Users should install 'tapkee' independently from author Web site (https://github.com/lisitsyn/tapkee)
or associated GitHub (https://github.com/lisitsyn/tapkee). Run 'package?tapkee' or help("tapkee-package")
for details related with your operation system. If 'tapkee' is not installed, Tapkee() will fail gracefully
and output the input data with warning.

Please note that "[warning] The neighborhood graph is not connected" message in most cases means that
'tapkee' run was unsuccessful. As a result, Tapkee() might return the matrix of NaN's.
One of possible workarounds is to specify the higher number of neigbors ('-k' option, default is 10).
See below for the example.

Note that the wrapper catches only one (main) type of 'tapkee' utility outputs. For other possible output
types (see 'tapkee -h' for explanation), run 'tapkee' without wrapper.
}

\value{Data frame with number of columns equal to number of dimensions given and "prefix" column names prefixes.}

\references{Sergey Lisitsyn and Christian Widmer and Fernando J. Iglesias Garcia. Tapkee: An Efficient Dimension Reduction Library. Journal of Machine Learning Research, 14: 2355-2359, 2013.}

\author{Alexey Shipunov}

\seealso{\code{\link{tapkee-package}}}

\examples{
## 'tapkee' vs. R base functions
system.time(Tapkee(iris[, -5], method="mds"))
system.time(cmdscale(dist(iris[, -5])))

## How to use 'add' option
plot(Tapkee(iris[, -5], "isomap", add="-k 47"), col=iris[, 5])

## 'tapkee' methods as of March 2019:
TM <- c(
"lle", # 1) locally_linear_embedding (lle),
"npe", # 2) neighborhood_preserving_embedding (npe),
"ltsa", # 3) local_tangent_space_alignment (ltsa),
"lltsa", # 4) linear_local_tangent_space_alignment (lltsa), 
"hlle", # 5) hessian_locally_linear_embedding (hlle),
"la", # 6) laplacian_eigenmaps (la),
"lpp", # 7) locality_preserving_projections (lpp),
"dm", # 8) diffusion_map (dm),
"isomap", # 9) isomap (isomap),
"l-isomap", # 10) landmark_isomap (l-isomap),
"mds", # 11) multidimensional_scaling (mds),
"l-mds", # 12) landmark_multidimensional_scaling (l-mds),
"spe", # 13) stochastic_proximity_embedding (spe),
"kpca", # 14) kernel_pca (kpca),
"pca", # 15) pca (pca),
"ra", # 16) random_projection (ra),
"fa", # 17) factor_analysis (fa),
"t-sne", # 18) t-stochastic_neighborhood_embedding (t-sne),
"ms") # 19) manifold_sculpting (ms)

## Iris example
oldpar <- par(mfrow=c(4, 5), mar=c(1, 1, 3, 1))
for (n in c(1:18)) {
plot(Tapkee(iris[, -5], method=TM[n], add="-k 50"),
 col=iris[, 5], pch=20, main=TM[n], xlab="", ylab="", xaxt="n", yaxt="n")
}
plot(iris[, 1:2], col=iris[, 5], pch=20, main="iris[, 1:2]", xlab="", ylab="",
 xaxt="n", yaxt="n")
par(oldpar)

## Generate typical 3D data
SR <- Gen.dr.data("swissroll")
SC <- Gen.dr.data("scurve")
HX <- Gen.dr.data("helix")
SS <- Gen.dr.data("ssphere")

## This will separate colors better
COL <- rainbow(1100)[1:1000]

## Swiss Roll
oldpar <- par(mfrow=c(4, 5), mar=c(1, 1, 3, 1))
for (n in 1:18) plot(Tapkee(SR, method=TM[n]), col=COL, pch=20, main=TM[n],
 xlab="", ylab="", xaxt="n", yaxt="n")
scatterplot3d::scatterplot3d(SR, color=COL, pch=20, main="Swiss Roll", xlab="", ylab="", zlab="",
 axis=FALSE, tick.marks=FALSE, label.tick.marks=FALSE, mar=c(1, 1, 3, 1))
par(oldpar)

## S-Curve
oldpar <- par(mfrow=c(4, 5), mar=c(1, 1, 3, 1))
for (n in 1:18) plot(Tapkee(SC, method=TM[n]), col=COL, pch=20, main=TM[n],
 xlab="", ylab="", xaxt="n", yaxt="n")
scatterplot3d::scatterplot3d(SC, color=COL, pch=20, main="S-Curve", xlab="", ylab="", zlab="",
 axis=FALSE, tick.marks=FALSE, label.tick.marks=FALSE, mar=c(1, 1, 3, 1))
par(oldpar)

## Helix
oldpar <- par(mfrow=c(4, 5), mar=c(1, 1, 3, 1))
for (n in 1:18) plot(Tapkee(HX, method=TM[n]), col=COL, pch=20,
 main=TM[n], xlab="", ylab="", xaxt="n", yaxt="n")
scatterplot3d::scatterplot3d(HX, color=COL, pch=20, main="Helix", xlab="", ylab="", zlab="",
 axis=FALSE, tick.marks=FALSE, label.tick.marks=FALSE, mar=c(1, 1, 3, 1))
par(oldpar)

## Severed Sphere
oldpar <- par(mfrow=c(4, 5), mar=c(1, 1, 3, 1))
for (n in 1:18) plot(Tapkee(SS, method=TM[n]), col=rainbow(nrow(SS)), pch=20,
 main=TM[n], xlab="", ylab="", xaxt="n", yaxt="n")
scatterplot3d::scatterplot3d(SS, color=rainbow(nrow(SS)), pch=20, main="Severed Sphere", xlab="",
 ylab="", zlab="", axis=FALSE, tick.marks=FALSE, label.tick.marks=FALSE, mar=c(1, 1, 3, 1))
par(oldpar)

}

\keyword{Dimension reduction}
