\name{marginals}
\alias{marginals}
\alias{dof}
\alias{is.board}
\alias{as.board}
\alias{.Cargs}
\title{Marginals of a board}
\description{
Various utilities to calculate the marginal totals of a board.
}
\usage{
marginals(x)
dof(x)
is.board(x)
as.board(x)
.Cargs(x)
}

\arguments{
  \item{x}{A matrix, usually including one or more \code{NA} entries,
    coerced to integer (a \dQuote{board}); see details section}
}
\details{
  Function \code{marginals()} takes a matrix and returns a list holding
  the marginal totals and the coordinates of blank squares.

  Function \code{dof()} takes a board and returns the number of degrees
  of freedom present.

  Function \code{.Cargs()} takes a matrix and coerces it to a list
  suitable for calling the \code{C++} routines; it is not really
  intended for the end-user.  This function uses formal S4 methods to
  coerce a matrix to an object of class \code{board} (checking for
  non-integer entries, etc), as do the functions documented in
  \code{allboards.Rd}.
}
\author{Robin K. S. Hankin}
\seealso{\code{\link{allboardprobs}}}
\examples{

data(icons)
marginals(icons)
  
}
\keyword{ array }
