\name{good}
\alias{good}
\title{Approximate number of contingency tables}
\description{
Approximate number of contingency tables with specified marginal
totals.
}
\usage{
good(x, method = "D", ...)
}
\arguments{
  \item{x}{An integer-valued matrix (with no \code{NA} entries)}
  \item{method}{The method to use; one of \code{A}, \code{B}, \code{C},
    \code{D}.  See details section}
  \item{\dots}{Further arguments (notably \code{n}), passed to
    \code{no.of.boards()}}
}
\details{
  All formulae and terminology taken from Good 1976.  The letters A-D
  are from the approximations given on pages 1167 and 1168.
  
  \strong{Note} This function will accept matrices with any \code{NA}
  entries, but a warning is given.  The number of permissable boards
  will be less than the number of permissible contingency tables
  considered by Good.

  The approximations are intended to provide rough-and-ready upper
  bounds for boards that have a few \code{NA}s.
}
\references{
  \itemize{
    \item I. J. Good 1976. \emph{On the Application of Symmetric
      Dirichlet Distributions and Their Mixtures to Contingency Tables}.
    The Annals of Statistics 4(6):1159--1189
  }
}
\author{Robin K. S. Hankin}
\note{
  Method \dQuote{A} is the exact answer, given by
  \code{no.of.boards()}.  Do not use this on large matrices!
  
  Methods \dQuote{B}, \dQuote{C}, and \dQuote{D} give (according to
  Good) increasingly accurate approximations to the exact answer.
  
}
\seealso{\code{\link{no.of.boards}}}
\examples{
a <- matrix(1,15,15)

good(a,"B")
good(a,"C")
good(a,"D")  #identical to answer given by method "C"

}
\keyword{ array }
\keyword{ array }
