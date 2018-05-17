\name{as.pairwise}
\alias{as.pairwise}
\title{Convert a results matrix to a board}
\description{
Given a square matrix giving the results of pairwise comparisons, return
a board object whose rows show the results of the comparisons.
}
\usage{
as.pairwise(x)
}
\arguments{
  \item{x}{A square matrix}
}
\details{
  With \code{x} an \eqn{n}-by-\eqn{n} square matrix, the rows and
  columns each correspond to one of \eqn{n} \dQuote{competitors}.  The
  \eqn{(i,j)}-th entry the number of times competitor \eqn{i} beats
  competitor \eqn{j} (the leading diagonal holds \code{NA}s because a
  competitor can't play himself).

  Function \code{as.pairwise()} turns this into a
  \eqn{n(n-1)/2}-by-\eqn{n} matrix whose rows each correspond to a
  pairwise comparison.  Any row has exactly two non-\code{NA} entries,
  in columns \eqn{i} and \eqn{j}, that correspond to elements
  \eqn{(i,j)} and \eqn{(j,i)} of \code{x}.  Thus the entry in column
  \eqn{i} is the number of times competitor \eqn{i} beats competitor
  \eqn{j}; and the entry in column \eqn{j} is the number of times
  competitor \eqn{j} beats competitor \eqn{i}.
  
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{aylmer.test}}}
\examples{
a <- matrix(rpois(25,4),5,5)
rownames(a) <- letters[1:5]
colnames(a) <- letters[1:5]
as.pairwise(a)
}
\keyword{math}
