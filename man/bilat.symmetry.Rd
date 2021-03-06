% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/bilat.symmetry.r
\name{bilat.symmetry}
\alias{bilat.symmetry}
\title{Analysis of bilateral symmetry}
\usage{
bilat.symmetry(A, ind = NULL, side = NULL, replicate = NULL,
  object.sym = FALSE, land.pairs = NULL, warpgrids = TRUE, mesh = NULL,
  verbose = FALSE)
}
\arguments{
\item{A}{An array (p x k x n) containing GPA-aligned coordinates for a set of specimens [for "object.sym=FALSE, A is of dimension (n x k x 2n)]}

\item{ind}{A vector containing labels for each individual. For matching symmetry, the matched pairs receive the same
label (replicates also receive the same label).}

\item{side}{An optional vector (for matching symmetry) designating which object belongs to which 'side-group'}

\item{replicate}{An optional vector designating which objects belong to which group of replicates}

\item{object.sym}{A logical value specifying whether the analysis should proceed based on object symmetry {=TRUE} or matching symmetry {=FALSE}}

\item{land.pairs}{An optional matrix (for object symmetry) containing numbers for matched pairs of landmarks across the line of symmetry}

\item{warpgrids}{A logical value indicating whether deformation grids for directional and fluctuating components
of asymmetry}

\item{mesh}{A mesh3d object to be warped to represent shape deformation of the directional and fluctuating components
of asymmetry if {warpgrids= TRUE} (see \code{\link{warpRefMesh}}).}

\item{verbose}{A logical value indicating whether the output is basic or verbose (see Value below)}
}
\value{
Function returns a list with the following components:
  \item{ANOVA.shape}{Procrustes ANOVA table assessing patterns of shape asymmetry}
  \item{ANOVA.size}{Procrustes ANOVA table assessing patterns of shape asymmetry (when {object.sym=FALSE})}
  \item{symm.shape}{The symmetric component of shape variation of the aligned specimens ({when verbose=TRUE})}
  \item{asymm.shape}{The asymmetric component of shape variation of the aligned specimens ({when verbose=TRUE})}
}
\description{
Function performs an analysis of directional and fluctuating asymmetry for bilaterally symmetric objects
}
\details{
The function quantifies components of shape variation for a set of specimens as described by their patterns of symmetry
 and asymmetry. Here, shape variation is decomposed into variation among individuals, variation among sides (directional
 asymmetry), and variation due to an individual x side interaction (fluctuating symmetry). These components are then
 statistically evaluated using Procrustes ANOVA and Goodall's F tests (i.e. an isotropic model of shape variation). Methods for both
 matching symmetry and object symmetry can be implemented. Matching symmetry is when each object contains mirrored
 pairs of structures (e.g., right and left hands) while object symmetry is when a single object is symmetric
 about a midline (e.g., right and left sides of human faces). Analytical and computational details concerning the
 analysis of symmetry in geometric morphometrics can be found in Mardia et al. 2000; Klingenberg et al. 2002.

Analyses of symmetry for matched pairs of objects is implemented when {object.sym=FALSE}. Here, a 3D array [p x k x 2n]
 contains the landmark coordinates for all pairs of structures (2 structures for each of n specimens). Because the two sets of
 structures are on opposite sides, they represent mirror images, and one set must be reflected prior to the analysis to
 allow landmark correspondence. IT IS ASSUMED THAT THE USER HAS DONE THIS PRIOR TO PERFORMING THE SYMMETRY ANALYSIS.
 Reflecting a set of specimens may be accomplished by multiplying one coordinate dimension
 by '-1' for these structures (either the x-, the y-, or the z-dimension). A vector containing information on individuals
 and sides must also be supplied. Replicates of each specimen may also be included in the dataset, and when specified will be
 used as measurement error (see Klingenberg and McIntyre 1998).

Analyses of object symmetry is implemented when {object.sym=TRUE}. Here, a 3D array [p x k x n] contains the landmark
 coordinates for all n specimens. To obtain information about asymmetry, the function generates a second set of objects
 by reflecting them about one of their coordinate axes. The landmarks across the line of symmetry are then relabeled to obtain
 landmark correspondence. The user must supply a list of landmark pairs. A vector containing information on individuals
 must also be supplied. Replicates of each specimen may also be included in the dataset, and when specified will be
 used as measurement error.
}
\examples{
#Example of matching symmetry

data(mosquito)
bilat.symmetry(mosquito$wingshape,ind=mosquito$ind,side=mosquito$side,
replicate=mosquito$replicate,object.sym=FALSE)

#Example of object symmetry

data(scallops)
bilat.symmetry(scallops$coorddata,ind=scallops$ind,object.sym=TRUE,land.pairs=scallops$land.pairs)
}
\author{
Dean Adams & Emma Sherratt
}
\references{
Klingenberg, C.P. and G.S. McIntyre. 1998. Quantitative genetics of geometric shape in the mouse mandible. Evolution. 55:2342-2352.

Mardia, K.V., F.L. Bookstein, and I.J. Moreton. 2000. Statistical assessment of bilateral symmetry of shapes. Biometrika. 87:285-300.

Klingenberg, C.P., M. Barluenga, and A. Meyer. 2002. Shape analysis of symmetric structures: quantifying variation among
individuals and asymmetry. Evolution. 56:1909-1920.
}
\keyword{analysis}

