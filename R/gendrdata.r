Gen.dr.data <- function(type, N=1000){
if (type=="swissroll") {
tt <- (3 * pi/2) * (1 + 2*runif(N))
height <- runif(N) - 0.5
X <- data.frame(x=tt*cos(tt), y=10*height, z=tt*sin(tt))[order(tt), ]
}
if (type=="scurve") {
tt <- 3 * pi * (runif(N) - 0.5)
height <- runif(N) - 0.5
X <- data.frame(x=sin(tt), y=10*height, z=sign(tt)*(cos(tt)-1))[order(tt), ]
}
if (type=="helix") {
tt <- ((1:N) / N) * 2 * pi
X <- data.frame(x=(2+cos(8*tt))*cos(tt), y=(2+cos(8*tt))*sin(tt), z=sin(8*tt))
}
if (type=="ssphere") {
p <- runif(N) * (2 * pi - 0.55)
t <- runif(N) * pi
## sever the poles and one slice from the sphere
indices = ((t < (pi - (pi / 8))) & (t > ((pi / 8))))
tt <- t[indices]
pp <- p[indices]
X <- data.frame(x=sin(tt) * cos(pp), y=sin(tt) * sin(pp), z=cos(tt))[order(tt), ]
}
return(X)
}
