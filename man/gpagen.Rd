% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/gpagen.r
\name{gpagen}
\alias{gpagen}
\title{Generalized Procrustes analysis of points, curves, and surfaces}
\usage{
gpagen(A, Proj = TRUE, ProcD = TRUE, PrinAxes = TRUE, ShowPlot = TRUE,
  curves = NULL, surfaces = NULL, ...)
}
\arguments{
\item{A}{An array (p x k x n) containing landmark coordinates for a set of specimens}

\item{Proj}{A logical value indicating whether or not the aligned Procrustes residuals should be projected
into tangent space}

\item{ProcD}{A logical value indicating whether or not Procrustes distance should be used as the criterion
for optimizing the positions of semilandmarks}

\item{PrinAxes}{A logical value indicating whether or not to align the shape data by principal axes}

\item{ShowPlot}{A logical value indicating whether or not a plot of Procrustes residuals should be displayed (calls \code{\link{plotAllSpecimens}})}

\item{curves}{An optional matrix defining which landmarks should be treated as semilandmarks on boundary
curves, and which landmarks specify the tangent directions for their sliding}

\item{surfaces}{An optional vector defining which landmarks should be treated as semilandmarks on surfaces}

\item{...}{Options to be passed to \code{\link{plotAllSpecimens}}}
}
\value{
Function returns a list with the following components:
  \item{coords}{A (p x k x n) array of aligned Procrustes coordinates, where p is the number of landmark
    points, k is the number of landmark dimensions (2 or 3), and n is the number of specimens. The third
    dimension of this array contains names for each specimen if specified in the original input array}
  \item{Csize}{A vector of centroid sizes for each specimen, containing the names for each specimen if
    specified in the original input array}
}
\description{
A general function to perform Procrustes analysis of two- or three-dimensional landmark data that
 can include both fixed landmarks and sliding semilandmarks
}
\details{
The function performs a Generalized Procrustes Analysis (GPA) on two-dimensional or three-dimensional
 landmark coordinates. The analysis can be performed on fixed landmark points, semilandmarks on
 curves, semilandmarks on surfaces, or any combination. To include semilandmarks on curves, one
 must specify a matrix defining which landmarks are to be treated as semilandmarks using the "curves="
 option. Likewise, to include semilandmarks
 on surfaces, one must specify a vector listing which landmarks are to be treated as surface semilandmarks
 using the "surfaces=" option. The "ProcD=TRUE" option will slide the semilandmarks along their tangent
 directions using the Procrustes distance criterion, while "ProcD=FALSE" will slide the semilandmarks
 based on minimizing bending energy. The aligned Procrustes residuals can be projected into tangent
 space using the "Proj=TRUE" option. NOTE: Large datasets may exceed the memory limitations of R.

Generalized Procrustes Analysis (GPA: Gower 1975, Rohlf and Slice 1990) is the primary means by which
  shape variables are obtained from landmark data (for a general overview of geometric morphometrics see
  Bookstein 1991, Rohlf and Marcus 1993, Adams et al. 2004, Zelditch et al. 2012, Mitteroecker and
  Gunz 2009, Adams et al. 2013). GPA translates all specimens to the origin, scales them to unit-centroid
  size, and optimally rotates them (using a least-squares criterion) until the coordinates of corresponding
  points align as closely as possible. The resulting aligned Procrustes coordinates represent the shape
  of each specimen, and are found in a curved space related to Kendall's shape space (Kendall 1984).
  Typically, these are projected into a linear tangent space yielding Kendall's tangent space coordinates
  (Dryden and Mardia 1993, Rohlf 1999), which are used for subsequent multivariate analyses. Additionally,
  any semilandmarks on curves and are slid along their tangent directions or tangent planes during the
  superimposition (see Bookstein 1997; Gunz et al. 2005). Presently, two implementations are possible:
  1) the locations of semilandmarks can be optimized by minimizing the bending energy between the
  reference and target specimen (Bookstein 1997), or by minimizing the Procrustes distance between the two
  (Rohlf 2010).
}
\examples{
#Example 1: fixed points only
data(plethodon)
gpagen(plethodon$land,PrinAxes=FALSE)
gpagen(plethodon$land,pointscale=2)

#Example 2: points and semilandmarks on curves
data(hummingbirds)

#Using Procrustes Distance for sliding
gpagen(hummingbirds$land,curves=hummingbirds$curvepts)

#Using bending energy for sliding
gpagen(hummingbirds$land,curves=hummingbirds$curvepts,ProcD=FALSE)

#Example 3: points, curves and surfaces
data(scallops)
#Using Procrustes Distance for sliding
gpagen(A=scallops$coorddata, curves=scallops$curvslide, surfaces=scallops$surfslide)
}
\author{
Dean Adams
}
\references{
Adams, D. C., F. J. Rohlf, and D. E. Slice. 2004. Geometric morphometrics: ten years of
   progress following the 'revolution'. It. J. Zool. 71:5-16.

Adams, D. C., F. J. Rohlf, and D. E. Slice. 2013. A field comes of age: Geometric
  morphometrics in the 21st century. Hystrix.24:7-14.

Bookstein, F. L. 1991. Morphometric tools for landmark data: Geometry and Biology.
 Cambridge Univ. Press, New York.

Bookstein, F. L. 1997. Landmark methods for forms without landmarks: morphometrics of
  group differences in outline shape.  1:225-243.

Dryden, I. L., and K. V. Mardia. 1993. Multivariate shape analysis. Sankhya 55:460-480.

Gower, J. C. 1975. Generalized Procrustes analysis. Psychometrika 40:33-51.

Gunz, P., P. Mitteroecker, and F. L. Bookstein. 2005. semilandmarks in three dimensions.
  Pp. 73-98 in D. E. Slice, ed. Modern morphometrics in physical anthropology. Klewer Academic/Plenum, New York.

Kendall, D. G. 1984. Shape-manifolds, Procrustean metrics and complex projective spaces.
  Bulletin of the London Mathematical Society 16:81-121.

Mitteroecker, P., and P. Gunz. 2009. Advances in geometric morphometrics. Evol. Biol. 36:235-247.

Rohlf, F. J., and D. E. Slice. 1990. Extensions of the Procrustes method for the optimal
  superimposition of landmarks. Syst. Zool. 39:40-59.

Rohlf, F. J., and L. F. Marcus. 1993. A revolution in morphometrics. Trends Ecol. Evol. 8:129-132.

Rohlf, F. J. 1999. Shape statistics: Procrustes superimpositions and tangent spaces.
  Journal of Classification 16:197-223.

Rohlf, F. J. 2010. tpsRelw: Relative warps analysis. Version 1.49. Department of Ecology and
  Evolution, State University of New York at Stony Brook, Stony Brook, NY.

Zelditch, M. L., D. L. Swiderski, H. D. Sheets, and W. L. Fink. 2012. Geometric morphometrics
  for biologists: a primer. 2nd edition. Elsevier/Academic Press, Amsterdam.
}
\keyword{analysis}

