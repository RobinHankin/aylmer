\name{odds.ratio}
\alias{odds.ratio}
\title{or}
\description{
The generalized odds ratio is a measure of the handedness of a cyclic
competition graph.
}
\usage{
odds.ratio(x)
}
\arguments{
  \item{x}{matrix with one degree of freedom, coerced to a board}
}
\details{
The generalized odds ratio is the product of the odds ratios of the
edges in a cyclic competition graph.

In the two-by-two case, the maximum likelihood estimatore of the odds
ratio is just
\eqn{\frac{a_{11}a_{22}}{a_{12}a_{21}}}{a[1,1]*a[2,2]/a[1,2]/a[2,1]}.
The generalization to larger boards with exactly one degree of freedom
is immediate: it is just the product of the entries on the diagonal,
divided by the product of the off-diagonal elements.

Ranking permissable tables in order of increasing odds ratio thus orders
the sample space and allows one to perform one-sided tests.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{pval.1dof}}}
\examples{

data(gear)
odds.ratio(gear)

aylmer.test(gear)
aylmer.test(gear,alternative="less")
aylmer.test(gear,alternative="greater")

}
\keyword{ array }

