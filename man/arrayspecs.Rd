% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/arrayspecs.r
\name{arrayspecs}
\alias{arrayspecs}
\title{Convert landmark data matrix into array (p x k x n)}
\usage{
arrayspecs(A, p, k)
}
\arguments{
\item{A}{A matrix containing landmark coordinates for a set of specimens}

\item{p}{Number of landmarks}

\item{k}{Number of dimensions (2 or 3)}
}
\value{
Function returns a (p x k x n) array, where p is the number of landmark points, k is the number
  of landmark dimensions (2 or 3), and n is the number of specimens. The third dimension of this array
  contains names for each specimen if specified in the original input matrix.
}
\description{
Convert a matrix of landmark coordinates into a 3-dimensional array
}
\details{
This function converts a matrix of landmark coordinates into a (p x k x n)
 array, which is the required input format for many functions in geomorph.
 The input matrix can be arranged such that the coordinates
 of each landmark are found on a separate row, or that each row contains all landmark
 coordinates for a single specimen.
}
\examples{
x<-matrix(rnorm(18),nrow=3)  # Random triangles (all coordinates on same row for each triangle)
arrayspecs(x,3,2)

x2<-matrix(rnorm(18),ncol=2) # Random triangles (each landmark on its own row)
arrayspecs(x2,3,2)
}
\author{
Dean Adams & Mike Collyer
}
\keyword{utilities}

