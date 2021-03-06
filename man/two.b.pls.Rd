% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/two.b.pls.r
\name{two.b.pls}
\alias{two.b.pls}
\title{Two-block partial least squares analysis for shape data}
\usage{
two.b.pls(A1, A2, warpgrids = TRUE, iter = 999, verbose = FALSE,
  label = NULL, ShowPlot = TRUE)
}
\arguments{
\item{A1}{A matrix (n x [p x k]) or 3D array (p x k x n) containing GPA-aligned coordinates for the first block}

\item{A2}{A matrix (n x [p x k]) or 3D array (p x k x n) containing GPA-aligned coordinates for the second block}

\item{warpgrids}{A logical value indicating whether deformation grids for shapes along PC1 should be displayed
(only relevant if data for A1 or A2 [or both] were input as 3D array)}

\item{iter}{Number of iterations for significance testing}

\item{verbose}{A logical value indicating whether the output is basic or verbose (see Value below)}

\item{label}{An optional vector indicating labels for each specimen that are to be displayed}

\item{ShowPlot}{A logical value indicating whether or not a plot of Procrustes residuals should be displayed}
}
\value{
Function returns a list with the following components:
  \item{value}{The estimate of association between block}
  \item{pvalue}{The significance level of the observed association}
  \item{Xscores}{PLS scores for the first block of landmarks (when {verbose=TRUE})}
  \item{Yscores}{PLS scores for the second block of landmarks (when {verbose=TRUE})}
}
\description{
Function performs two-block partial least squares analysis to assess the degree of association between
to blocks of Procrustes-aligned coordinates (or other variables)
}
\details{
The function quantifies the degree of association between two blocks of shape data as
  defined by landmark coordinates using partial least squares (see Rohlf and Corti 2000). If geometric morphometric data are used, it is assumed
  that the landmarks have previously been aligned using
  Generalized Procrustes Analysis (GPA) [e.g., with \code{\link{gpagen}}]. If other variables are used, they must be input as a 2-Dimensional matrix (rows = specimens, columns = variables).

A plot of PLS scores from Block1 versus Block2 is provided for the first set of PLS axes. Thin-plate spline
  deformation grids along these axes are also shown (if data were input as a 3D array).
}
\examples{
data(plethShapeFood)
Y.gpa<-gpagen(plethShapeFood$land)    #GPA-alignment

#2B-PLS between head shape and food use data
two.b.pls(Y.gpa$coords,plethShapeFood$food,iter=99)
}
\author{
Dean Adams
}
\references{
Rohlf, F.J., and M. Corti. 2000. The use of partial least-squares to study covariation in shape.
Systematic Biology 49: 740-753.
}
\keyword{analysis}

