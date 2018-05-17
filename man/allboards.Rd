\name{allboards}
\alias{allboards}
\alias{allboardprobs}
\alias{allprobs}
\alias{no.of.boards}
\alias{is.1dof}
\alias{maxlike}
\alias{board-class}
\title{Various board functionality}
\description{
  A \dfn{board} is a matrix with non-negative integer elements; an
  object of class \code{board}.  It
  represents a contingency table; \code{NA} entries specify structural
  zeros.  Function \code{allboards()} takes a matrix \code{x}, coerces
  it to a board, then enumerates all boards with identical marginal
  totals, and zeros at the same locations as the structural zeros of
  \code{x}.
}
\usage{
no.of.boards(x, n = 1e5)
allboards(x, n = 1e5, func=NULL)
allprobs(x, n = 1e5, normalize=TRUE, give.log=FALSE, use.C=TRUE)
is.1dof(x)
maxlike(x)
}
\arguments{
  \item{x}{Matrix, coerced to integer.  Usually with one or more
    \code{NA} entries}
  \item{n}{Integer specifying how many boards to return.  See details
    section}
  \item{use.C}{In function \code{allprobs()}, Boolean with default
    \code{TRUE} meaning to use the \code{C} routine, and \code{FALSE}
    meaning to use an \code{R} routine}
  \item{func}{In function \code{allboards()}, argument to specify the
    function returned; default \code{NULL} means to return the whole
    board}
  \item{normalize}{In function \code{allprobs()}, Boolean with default
    \code{TRUE} meaning to normalize the returned values so they sum to
    one (and thus correspond to probabilities \emph{conditional} on the
    marginal totals and structural zeros)}
  \item{give.log}{Boolean specifying whether to return the log of the
    probabilities}
}
\details{
  Function \code{no.of.boards(x)} returns the number of boards with
  non-negative entries that have the same marginal totals as \code{x}
  and structural zeros where \code{x} has \code{NA} entries (that is,
  \dfn{permissible boards}).  Function \code{allboards()} enumerates
  such boards.

  Function \code{prob(x)} returns a number proportional to the
  probability of observing \code{x}, given the structural zeros and
  marginal total.

  Function \code{is.1dof(x)} returns \code{TRUE} if and only if \code{x}
  is of the same form as \code{gear}, and thus has only one degree of
  freedom.  Note that there exist other configurations which have only
  one degree of freedom (such as any permutation of the rows and columns
  of \code{gear}).

  Function \code{maxlike(x)} returns the entry of \code{allboards()}
  that has the highest probability of occurring.  Compare \code{best()}.

  In functions \code{no.of.boards()} and \code{allboards()}, argument
  \code{n} is the maximum number of boards (or maximum count) returned,
  except for special value \code{0}, which means to return (or count)
  all possible boards.

  (Actually, if there are more than \code{n} permissible boards, the
  first \code{n+1} boards are returned by \code{allboards()}, and
  \code{n+1} is returned by \code{no.of.boards()}.  This is because the
  \code{C} code checks for the last board having a successor).

  \strong{Warning} Many frequently-encountered boards have a very large
  number of possible configurations, and if called with \code{n=0},
  these functions will iterate for a \strong{very} long time before
  stopping.

}
\author{Robin K. S. Hankin (\R); Luke G. West (C++)}
\seealso{\code{\link{marginals}},\code{\link{aylmer.test}},\code{\link{best}}}
\examples{
data(chess)
allboards(chess)
maxlike(chess)

data(frogs)

x <- matrix(c(28,2,9,7,3,1,14,34,9,8,6,2),ncol=2)
\dontrun{no.of.boards(x)} # Should be 339314 according to Gail and Mantel


data(iqd)
f <- function(x){x[1,1]}
table(allboards(iqd,1000,f))

}
\keyword{ array }
